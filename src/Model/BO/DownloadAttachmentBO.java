package Model.BO;

import Model.BEAN.Attachment;
import Model.DAO.DownloadAttachmentDAO;

public class DownloadAttachmentBO {
	public Attachment downAttachment(String id) {
		DownloadAttachmentDAO downloadAttachmentDAO = new DownloadAttachmentDAO();
		Attachment attachment = new Attachment();
		try {
			attachment = downloadAttachmentDAO.downloadAttachment(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return attachment;
	}
}
