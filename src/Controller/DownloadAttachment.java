package Controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BEAN.Attachment;
import Model.BO.DownloadAttachmentBO;

@WebServlet("/DownloadAttachment")
public class DownloadAttachment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id_attachment");
			DownloadAttachmentBO downloadAttachmentBO = new DownloadAttachmentBO();
			Attachment attachment = new Attachment();
			attachment = downloadAttachmentBO.downAttachment(id);

			String file_name = attachment.getfile_name();
			String file_data = attachment.getfile_data();
			ByteArrayInputStream test = new ByteArrayInputStream(file_data.getBytes());
			System.out.println("File Name: " + file_name);
			String contentType = this.getServletContext().getMimeType(file_name);
			System.out.println("Content Type: " + contentType);
			response.setHeader("Content-Type", contentType);
			response.setHeader("Content-Length", String.valueOf(attachment.getfile_data().length()));
			response.setHeader("Content-Disposition", "inline; filename=\"" + attachment.getfile_name() + "\"");
			byte[] bytes = new byte[1024];
			int bytesRead;
			while ((bytesRead = test.read(bytes)) != -1) {
				response.getOutputStream().write(bytes, 0, bytesRead);
			}
			test.close();
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
