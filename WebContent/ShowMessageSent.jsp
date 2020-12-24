<%@page import="Model.BEAN.Attachment_Sent"%>
<%@page import="Model.BEAN.Message_Sent"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="Model.BEAN.Attachment"%>
<%@page import="Model.BEAN.User"%>
<%@page import="Model.BEAN.Message"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Details</title>
<link rel="stylesheet" type="text/css" href="all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="topDiv">
		<h2 align="center"><%=session.getAttribute("name")%>'s Mail
		</h2>
	</div>
	<%
		Message_Sent message = (Message_Sent) request.getAttribute("mess");
		ArrayList<Attachment_Sent> attachment = (ArrayList<Attachment_Sent>) request.getAttribute("attachment");
	%>
	<div class="centerDiv">
		<table width="400" height="auto" border="2" align="center">
			<TR>
				<TH>Sender</TH>
				<td>Me</td>
			</TR>
			<TR>
				<TH>Receiver</TH>
				<td> <%=message.getreceivers()%></td>
			</TR>
			<TR>
				<TH>Title</TH>
				<td><%=message.gettitle()%></td>
			</TR>
			<TR>
				<TH>Content</TH>
				<td><%=message.getcontent()%></td>
			</TR>
			<%
				if (attachment.size() != 0) {
			%></TR>
			<TR>
				<TH>File</TH>
				<td>
					<%
						for (int i = 0; i < attachment.size(); i++) {
								String f_n = (attachment.get(i)).getfile_name();
					%> <a href="DownloadAttachment?id_attachment=<%=attachment.get(i).getid()%>"><%=f_n%></a><br> <%
 	}
 %>
				</td>
			</TR>
			<%
				}
			%>
		</table>
	</div>
	<%
		String name_sender = message.getreceivers();
		session.setAttribute("name_sender", name_sender);
	%>
	<div class="centerDiv">
		<span><i class="fa fa-reply"> </i></span><span><a
			href="javascript:history.back()"><input type="button"
				value="Back"></a></span> <span><i class="fa fa-share"> </i></span><span><a
			href="Compose?name_sender=<%=message.getreceivers()%>"><input type="button"
				value="Reply"></a></span>
	</div>
</body>
</html>