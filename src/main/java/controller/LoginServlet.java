package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		if(username.equals("Admin") && password.equals("Admin@123")) {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script> alert('Logged on AdminPortal!'); window.location.replace('AdminDashBoard.jsp'); </script>");
		}
		
		User user = new User();
		user.setFirstname(username);
		user.setPassword(password);
		
		
		
		LoginDAO logdao=new LoginDAO();
		String ward= logdao.validate(user);
		
//		if(role!=null) {
//			if(role.equals("Admin")) {
//				response.setContentType("text/html;charset=UTF-8");
//				response.getWriter().write("<script> alert('Logged on AdminPortal!'); window.location.replace('AdminDashBoard.jsp'); </script>");
//			}
//			else if(role.equals("nurse")) {
//				response.setContentType("text/html;charset=UTF-8");
//				response.getWriter().write("<script> alert('Logged on NursePortal!'); window.location.replace('NurseGeneralWard.jsp'); </script>");
//			}
//		}
		

		if (ward != null) {
			HttpSession session = request.getSession();
		    session.setAttribute("username", user.getFirstname());
		    if (ward.equalsIgnoreCase("General Ward")) {
		        response.sendRedirect("NurseGeneralWard.jsp");
		    } else if (ward.equalsIgnoreCase("Cardiology Ward")) {
		        response.sendRedirect("NurseCardiologyWard.jsp");
		    } else if (ward.equalsIgnoreCase("Ortho Pedic Ward")) {
		        response.sendRedirect("NurseOrthoPedicWard.jsp");
		    } else if (ward.equalsIgnoreCase("Gynecology Ward")) {
		        response.sendRedirect("NurseGynecologyWard.jsp");
		    } else if (ward.equalsIgnoreCase("ICU")) {
		        response.sendRedirect("NurseICU.jsp");
		    } else {
		       
		        response.sendRedirect("InvalidWard.jsp");
		    }
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script> alert('Your role is not determined! Please login after registration.'); window.location.replace('login.jsp'); </script>");
		}
		
		
	}

}
