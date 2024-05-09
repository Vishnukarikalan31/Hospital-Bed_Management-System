package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BedDAO;
import dao.DashboardDAO;
import model.Bed;

/**
 * Servlet implementation class GwServlet
 */
@WebServlet("/gwServlet")
public class GwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String bedno = request.getParameter("bedno");
	        String rent = request.getParameter("rent");
	        String type = request.getParameter("type");

	        Bed bed = new Bed(bedno, rent, type);
	        BedDAO bedDAO = new BedDAO();
	        DashboardDAO dao = new DashboardDAO();
	        int count = dao.getRowCount();
	        int vac=dao.vacantcount();
	        int book=dao.Bookedcount();

	        HttpSession session = request.getSession();
	        session.setAttribute("count", count);
	        session.setAttribute("vac", vac);
	        session.setAttribute("book", book);
	        
	        if(bedDAO.addGW(bed)) {
				response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().write("<script> alert('Bed Added Successful!'); window.location.replace('Boxes.jsp'); </script>");
			   
			}
			else {
				response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().write("<script> alert('Registration Unsuccessful!'); window.location.replace('AdminDashBoard.jsp'); </script>");
			}
	}

}
