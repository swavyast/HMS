package com.ml.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ml.dao.UserDao;
import com.ml.db.DatabaseConfiguration;
import com.ml.entity.User;

@SuppressWarnings({ "deprecation", "serial" })
@WebServlet("/user")
public class UserLoginServlet extends HttpServlet {

	private String success;
	private String problem;
	private HttpSession session;
	/* private Cookie c; */

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String em = req.getParameter("uname");
			String ps = req.getParameter("pwd");

			UserDao dao = new UserDao(DatabaseConfiguration.getMySQLConnection());

			User user = dao.userLogin(em, ps);
			session = req.getSession();
			if (user != null) {
				String success = "Welcome to mediHome";
				session.setAttribute("response", success);
				session.setAttribute("userObj", user);
				session.setMaxInactiveInterval(0);
				resp.sendRedirect("user/index.jsp");
			} else {
				problem = "Sorry! we couldn't find any user by the details you provided\nMake sure your login details are correct, then try again\n(Do keep in mind that login attempts may be limited)";
				System.out.println(problem);
				session.setAttribute("response", problem);
				resp.sendRedirect("user-login.jsp");
			}

		} catch (Exception e) {
			System.out.println(
					"Problem occured in login servlet : check-out this log below for better insights into the problem");
			e.printStackTrace();
		}
	}
}