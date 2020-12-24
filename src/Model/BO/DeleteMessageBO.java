package Model.BO;

import Model.DAO.DeleteMessageDAO;
public class DeleteMessageBO {
	DeleteMessageDAO deleteMessageDAO = new DeleteMessageDAO();
	public boolean deleteMessage(String[] listId) {
		boolean check = false;
		try {
			check = deleteMessageDAO.deleteMessage(listId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public boolean deleteMessageSent(String[] listId) {
		boolean check = false;
		try {
			check = deleteMessageDAO.deleteMessageSent(listId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
}
