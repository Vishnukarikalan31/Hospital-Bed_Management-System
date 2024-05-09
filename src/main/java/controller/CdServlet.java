package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BedDAO;
import model.Bed;

/**
 * Servlet implementation class CdServlet
 */
@WebServlet("/cdServlet")
public class CdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String bedno = request.getParameter("bedno");
	        String rent = request.getParameter("rent");
	        String type = request.getParameter("type");

	        Bed bed = new Bed(bedno, rent, type);
	        BedDAO bedDAO = new BedDAO();
	        
	        if(bedDAO.addCW(bed)) {
				response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().write("<script> alert('Bed Added Successful!'); window.location.replace('GCboxes.jsp'); </script>");
			}
			else {
				response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().write("<script> alert('Registration Unsuccessful!'); window.location.replace('AdminDashBoard.jsp'); </script>");
			}
	}

}
