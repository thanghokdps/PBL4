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
import Model.BO.ComposeMailBO;
import Model.BO.HomepageBO;

@WebServlet("/ComposeMail")
public class ComposeMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ComposeMail() {
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String destination = null;
		String receiver = request.getParameter("receiver");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		int id_sender = (int)session.getAttribute("id") ;
		ComposeMailBO composeMailBO = new ComposeMailBO();
		if (!composeMailBO.sendMail(id_sender, receiver, title, content)) {
			System.out.println("khong gui dc");
		}
		else {
			System.out.println("Success");
			request.setAttribute("alertMsg", "send sucess");
			HomepageBO homepageBO = new HomepageBO();
			ArrayList<Message> listMessage = new ArrayList<Message>();
			listMessage = homepageBO.getListMessage(session.getAttribute("id").toString());
			request.setAttribute("listMessage", listMessage);
			destination = "/Homepage.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
			
	}

}
