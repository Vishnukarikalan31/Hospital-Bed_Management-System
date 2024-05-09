package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddPatientDAO;
import model.Patient;

/**
 * Servlet implementation class AddPatientServlet
 */
@WebServlet("/addPatientServlet")
public class AddPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String patientname=request.getParameter("patientname");
		int patientage=Integer.parseInt(request.getParameter("patientage")) ;
		String gender=request.getParameter("gender");
		String patientphonenumber=request.getParameter("patientphonenumber");
		String relativephonenumber=request.getParameter("relativephonenumber");
		String dateofadmit=request.getParameter("dateofadmit");
		
		
		Patient patient = new Patient( patientname,patientage,gender,patientphonenumber,relativephonenumber,dateofadmit);
		
		AddPatientDAO addpatientdao=new AddPatientDAO();
		
		if(addpatientdao.add(patient)) {
			response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("<script> alert('Registration Successful!'); window.location.replace('vpop.jsp'); </script>");
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("<script> alert('Registration Unsuccessful!'); window.location.replace('vpop.jsp'); </script>");
		}
	}

}
