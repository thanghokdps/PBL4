package Model.BO;

import Model.DAO.ComposeMailDAO;

public class ComposeMailBO {
	public boolean sendMail(int id_sender, String receiver, String title, String content) {
		ComposeMailDAO composeMailDAO = new ComposeMailDAO();
		return composeMailDAO.Addmail(id_sender, receiver, title, content);
	}
}
