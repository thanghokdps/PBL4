package Model.BO;

import java.util.ArrayList;

import Model.BEAN.Message;
import Model.DAO.SearchMessageDAO;

public class SearchMessageBO {
	SearchMessageDAO searchMessageDAO = new SearchMessageDAO();
	public ArrayList<Message> search(String text, String id) {
		ArrayList<Message> listMessage = new ArrayList<Message>();
		try {
			listMessage = searchMessageDAO.search(text, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listMessage;
	}
}
