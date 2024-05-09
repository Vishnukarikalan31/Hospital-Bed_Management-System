package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import Util.DBUtil;

/**
 * Servlet implementation class GeneratePDFServlet
 */
@WebServlet("/GeneratePDFServlet")
public class GeneratePDFServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"patient_data.pdf\"");

        try (Connection con = DBUtil.getConnection();
                PreparedStatement pstmt = con.prepareStatement("SELECT * FROM patient");
                ResultSet rs = pstmt.executeQuery();
                PDDocument document = new PDDocument()) {

            PDPage page = new PDPage();
            document.addPage(page);

            try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
  
                // Header
                contentStream.beginText();
                contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);
                contentStream.newLineAtOffset(50, 750);
                contentStream.showText("Patient Data");
                contentStream.endText();

                // Table headers
                contentStream.beginText();
                contentStream.setFont(PDType1Font.HELVETICA_BOLD, 8);
                contentStream.newLineAtOffset(50, 700);
                contentStream.showText("Patient ID");
                contentStream.newLineAtOffset(40, 0);
                contentStream.showText("Patient Name");
                contentStream.newLineAtOffset(60, 0);
                contentStream.showText("Age");
                contentStream.newLineAtOffset(30, 0);
                contentStream.showText("Gender");
                contentStream.newLineAtOffset(40, 0);
                contentStream.showText("Phone Number");
                contentStream.newLineAtOffset(80, 0);
                contentStream.showText("Relative's Phone Number");
                contentStream.newLineAtOffset(100, 0);
                contentStream.showText("Date of Admit");
                contentStream.newLineAtOffset(80, 0);
                contentStream.showText("Date of Discharge");
                contentStream.endText();

                // Populate table with data
                int y = 690;
                while (rs.next()) {
                    contentStream.beginText();
                    contentStream.setFont(PDType1Font.HELVETICA, 8);
                    contentStream.newLineAtOffset(50, y);
                    contentStream.showText(formatString(rs.getString("patientid"), 15));
                    contentStream.newLineAtOffset(40, 0);
                    contentStream.showText(formatString(rs.getString("patientname"), 25));
                    contentStream.newLineAtOffset(60, 0);
                    contentStream.showText(formatString(rs.getString("patientage"), 10));
                    contentStream.newLineAtOffset(30, 0);
                    contentStream.showText(formatString(rs.getString("gender"), 10));
                    contentStream.newLineAtOffset(40, 0);
                    contentStream.showText(formatString(rs.getString("patientphonenumber"), 15));
                    contentStream.newLineAtOffset(80, 0);
                    contentStream.showText(formatString(rs.getString("relativephonenumber"), 20));
                    contentStream.newLineAtOffset(100, 0);
                    contentStream.showText(formatString(rs.getString("dateofadmit"), 15));
                    contentStream.newLineAtOffset(80, 0);
                    contentStream.showText(formatString(rs.getString("dateofdischarge"), 15));
                    contentStream.endText();
                    y -= 10; // Adjust for the next row
                }

                // Hospital signature
                contentStream.beginText();
                contentStream.setFont(PDType1Font.HELVETICA_BOLD, 8);
                contentStream.newLineAtOffset(50, 50);
                contentStream.showText("Hospital Signature: ____________________");
                contentStream.endText();
            }

            document.save(response.getOutputStream());
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred: " + e.getMessage());
        }
        
    }
    private String formatString(String input, int maxCharacters) {
        if (input == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        int lineLength = 0;
        for (char c : input.toCharArray()) {
            sb.append(c);
            lineLength++;
            if (lineLength >= maxCharacters && c != ' ') {
                sb.append('\n');
                lineLength = 0;
            }
        }
        return sb.toString();
    }
}