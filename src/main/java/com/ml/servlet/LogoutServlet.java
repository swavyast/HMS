package com.ml.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private String response = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session = req.getSession();
	session.removeAttribute("userObj");
	session.removeAttribute("adminObj");
	session.removeAttribute("doctorObj");
	response = "You have been logged out successfuly.";
	System.out.println(response);
	session.setAttribute("response", response);
	resp.sendRedirect("index.jsp");
    }
	/*
	 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { HttpSession session =
	 * req.getSession(); session.removeAttribute("userObj");
	 * session.removeAttribute("adminObj"); session.removeAttribute("doctorObj");
	 * response = "You have been logged out successfuly.";
	 * System.out.println(response); session.setAttribute("response", response);
	 * resp.sendRedirect("index.jsp"); }
	 */
    
}
