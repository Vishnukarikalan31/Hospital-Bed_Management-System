package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.DBUtil;

/**
 * Servlet implementation class icubedbook
 */
@WebServlet("/icuBedBook")
public class icubedbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String bedDetails = request.getParameter("bedDetails");
        long patientId = Long.parseLong(request.getParameter("patientId"));

        // Split the bedDetails string into an array
        String[] detailsArray = bedDetails.split(",");

        // Extract relevant information
        int bedId;

        try {
            if (!detailsArray[0].isEmpty()) {
                bedId = Integer.parseInt(detailsArray[0]);
            } else {
                // Handle the case where the string is empty
                throw new NumberFormatException("Bed ID is empty");
            }

            // Update the bed record in the database
            try (Connection con = DBUtil.getConnection();
                 PreparedStatement preparedStatement = con.prepareStatement("UPDATE icuward SET patientid=? WHERE id=?")) {

                preparedStatement.setLong(1, patientId);
                preparedStatement.setInt(2, bedId);
                preparedStatement.executeUpdate();

                String alertScript = "<script>alert('Successfully booked'); window.location.href='NurseICU.jsp';</script>";
                response.getWriter().write(alertScript);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (NumberFormatException e) {
            // Handle the NumberFormatException (e.g., log or show an error message)
            e.printStackTrace();

            String alertScript = "<script>alert('Invalid Bed ID'); window.location.href='NurseICU.jsp';</script>";
            response.getWriter().write(alertScript);
        }
    }

}
