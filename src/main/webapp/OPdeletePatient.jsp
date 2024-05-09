<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException, java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.ServletException, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpServletRequest" %>
<%@ page import="Util.DBUtil" %>

<%
	
    String patientIdString = request.getParameter("patientId");

	if (patientIdString != null && !patientIdString.isEmpty()) {
       
		try {
            long patientId = Long.parseLong(patientIdString);

        
            Connection con = null;
            try {
                con = DBUtil.getConnection();
               
             // Update the dischargedate column in the patient table based on patientId
                String updateDischargeDateQuery = "UPDATE patient SET dateofdischarge = ? WHERE patientid = ?";
                try (PreparedStatement updateDateStatement = con.prepareStatement(updateDischargeDateQuery)) {
                    updateDateStatement.setDate(1, new java.sql.Date(new Date().getTime())); // Current date
                    updateDateStatement.setLong(2, patientId);
                    updateDateStatement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<p>Error occurred during update: " + e.getMessage() + "</p>");
                }


                // Update the cardiologyward table to remove the patient
                String deleteGeneralWardBedQuery = "UPDATE orthopedicward SET patientid = NULL WHERE patientid = ?";
                try (PreparedStatement bedStatement = con.prepareStatement(deleteGeneralWardBedQuery)) {
                    bedStatement.setLong(1, patientId);
                    int bedRowsAffected = bedStatement.executeUpdate();

                    if (bedRowsAffected > 0) {
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().write("<script> alert('Discharge Successful!'); window.location.replace('NurseOrthoPedicWard.jsp'); </script>");
                        return;
                    } else {
                        out.println("<p>No bed found for patient ID " + patientId + ".</p>");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error occurred during deletion.</p>");
            } finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (NumberFormatException e) {
            out.println("<p>Invalid patient ID format.</p>");
        }
    } else {
        out.println("<p>Invalid or missing patient ID.</p>");
    }
%>
