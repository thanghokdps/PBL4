package Model.BO;

import Model.DAO.ConfirmDAO;

public class ConfirmBO {
	public boolean Confirm(String email, String username, String password) {
		ConfirmDAO confirmDAO = new ConfirmDAO();
		return confirmDAO.confirm(email, username, password);
	}
}