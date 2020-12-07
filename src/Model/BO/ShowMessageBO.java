package Model.BO;

import Model.BEAN.Message;
import Model.DAO.ShowMessageDAO;

public class ShowMessageBO {
	ShowMessageDAO showMessageDAO = new ShowMessageDAO();
	public Message getMessage(String id) {
		Message message = new Message();
		try {
			message = showMessageDAO.getMessage(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
}
