package Controller;

import java.io.IOException;
import java.sql.SQLException;
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
import Model.BO.ConfirmBO;
import Model.BO.HomepageBO;


@WebServlet("/Confirm")
public class Confirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Confirm() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String destination = null;
		HttpSession session = request.getSession();
		String codevalid = (String)session.getAttribute("codevalid");
		String code = request.getParameter("confirmcode");
		
		if (code.equals(codevalid)) {
			if ((String)session.getAttribute("flag")=="1") {
				ConfirmBO confirmBO = new ConfirmBO();
				String email = (String)session.getAttribute("email");
				String username = (String)session.getAttribute("username");
				String password = (String)session.getAttribute("password");
				if (confirmBO.Confirm(email, username, password)) {
					AuthenticateBO authenticateBO = new AuthenticateBO();
					User user = new User();
					user = authenticateBO.isUser(username, password);
					session.setAttribute("id", user.getid());
					HomepageBO homepageBO = new HomepageBO();
					ArrayList<Message> listMessage = new ArrayList<Message>();
					listMessage = homepageBO.getListMessage(String.valueOf(user.getid()));
					request.setAttribute("listMessage", listMessage);
					destination = "/Homepage.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				}
				else {
					System.out.println("khong the dang ky");
				}
			}
			else if((String)session.getAttribute("flag")=="0"){
				ConfirmBO confirmBO = new ConfirmBO();
				String email = (String)session.getAttribute("email");
				String password = (String)session.getAttribute("password");
				try {
					if (confirmBO.forgetPassword(email, password)) {
						destination = "/Login.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
						rd.forward(request, response);
					}
				} catch (SQLException | IOException | ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else {
			destination = "/Confirm.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
	}

}