package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BEAN.Message;
import Model.BEAN.User;
import Model.BO.AuthenticateBO;
import Model.BO.HomepageBO;

@WebServlet("/Authenticate")
public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		String name = request.getParameter("UserName");
		String pass = request.getParameter("PassWord");
		AuthenticateBO authenticateBO = new AuthenticateBO();
		User user = new User();
		user = authenticateBO.isUser(name, pass);
		HttpSession session = request.getSession();
		session.setAttribute("username", user.getusername());
		session.setAttribute("id", user.getid());
		if (user.getid() != 0) {
			HomepageBO homepageBO = new HomepageBO();
			ArrayList<Message> listMessage = new ArrayList<Message>();
			listMessage = homepageBO.getListMessage(String.valueOf(user.getid()));
			request.setAttribute("listMessage", listMessage);
			destination = "/Homepage.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			destination = "/Login.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
	}
}