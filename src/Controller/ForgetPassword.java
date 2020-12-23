package Controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String destination = null;
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		String codeString = ValidEmail.randomCode();
		session.setAttribute("codevalid", codeString);
		session.setAttribute("password", request.getParameter("password"));
		session.setAttribute("email", email);
		session.setAttribute("flag", "0");
		String host = "smtp.gmail.com";
		String port = "587";
		String sub = "CODE";
		String usernameString  = "hoa10chuyenltt2015@gmail.com";
		String passString = "hoa10chuyen";
		
		try {
			ValidEmail.sendEmail(host, port, usernameString, passString, email, sub, codeString);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		destination = "/ConfirmForm.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);
	}
}
