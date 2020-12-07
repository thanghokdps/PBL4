package Model.BO;

import Model.DAO.ComposeDAO;

public class ComposeBO {
	public boolean insertMess(int id_sender, String receiver, String title, String content) {
		ComposeDAO composeDAO = new ComposeDAO();
		return composeDAO.insertMess(id_sender, receiver, title, content);
	}
}