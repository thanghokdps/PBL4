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
import Model.BO.ComposeBO;
import Model.BO.GetAllUserBO;
import Model.BO.HomepageBO;

@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Compose() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		if (request.getParameter("name_sender") != null) {
			String name_sender = request.getParameter("name_sender");
			request.setAttribute("name_sender", name_sender);
			destination = "/Compose.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			String receiver = request.getParameter("receiver");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			HttpSession session = request.getSession();
			String id_sender = (String) session.getAttribute("id");
			int id_sd = Integer.parseInt(id_sender);
			ComposeBO composeBO = new ComposeBO();
			if (!composeBO.insertMess(id_sd, receiver, title, content)) {
				System.out.println("Don't send");
			} else {
				request.setAttribute("alertMsg", "send sucess");
				HomepageBO homepageBO = new HomepageBO();
				ArrayList<Message> listMessage = new ArrayList<Message>();
				listMessage = homepageBO.getListMessage(String.valueOf(session.getAttribute("id")));
				GetAllUserBO getAllUserBO = new GetAllUserBO();
				ArrayList<User> listUser = new ArrayList<User>();
				listUser = getAllUserBO.getListUser();
				request.setAttribute("listMessage", listMessage);
				request.setAttribute("listUser", listUser);
				destination = "/Homepage.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		}
	}
}