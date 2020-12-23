package Model.BO;

import java.util.ArrayList;

import Model.BEAN.Attachment;
import Model.DAO.GetListAttachmentDAO;

public class GetListAttachmentBO {
	public ArrayList<Attachment> getAttachment(String id_mess) {
		GetListAttachmentDAO getListAttachmentDAO = new GetListAttachmentDAO();
		ArrayList<Attachment> attachment = new ArrayList<Attachment>();
		try {
			attachment = getListAttachmentDAO.getAttachment(id_mess);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return attachment;
	}
}
