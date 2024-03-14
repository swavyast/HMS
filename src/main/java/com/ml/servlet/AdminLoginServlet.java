package com.ml.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ml.dao.AdminDao;
import com.ml.db.DatabaseConfiguration;
import com.ml.entity.Admin;

//Step - 1 : URL mapping
@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    private String success = null;
    private String problem = null;
    private HttpSession session = null;

    //Step-2 : Override doGet or doPost
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	//Step-3 : Implement your logic to communicate with your web-client.

	String em = req.getParameter("uid");
	String pwd = req.getParameter("scode");
	Admin a = null;
	session = req.getSession();
	AdminDao adao = new AdminDao(DatabaseConfiguration.getMySQLConnection());
	try {
	    a = adao.adminLogin(em, pwd);
	    if (a!=null) {
		success = "glad to see you back ";
		session.setAttribute("response", success);
		session.setAttribute("adminObj", a);
		session.setAttribute("aid", a.getAdid());
		session.setAttribute("name", a.getName().replaceAll(" [a-zA-Z0-9]*", ""));
		session.setMaxInactiveInterval(0);
		resp.sendRedirect("admin/index.jsp");
	    }else{
		problem = "I'm sorry, your login credentials doesn't match with our admin database.<br>"
			+ "Verify your credentials and then try again after sometimes.";
		session.setAttribute("response", problem);
		resp.sendRedirect("admin/index.jsp");
	    } 

	} catch (SQLException e) {

	    e.printStackTrace();
	}
    }
}
