package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RegisterDAO;
import model.User;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		String password=request.getParameter("password");
		String ward=request.getParameter("department");
		
		User user=new User(firstname,lastname,email,contact,password,ward);
		
		RegisterDAO regdao = new RegisterDAO();
		if(regdao.register(user)) {
			response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("<script> alert('Registration Successful!'); window.location.replace('login.jsp'); </script>");
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("<script> alert('Registration Unsuccessful!'); window.location.replace('registration.jsp'); </script>");
		}

		
	    
	
	}

}
