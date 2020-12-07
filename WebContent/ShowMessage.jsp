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
		Message message = (Message) request.getAttribute("mess");
	%>
	<%
		ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
	%>
	<div class="centerDiv">
		<table width="400" height="auto" border="2" align="center">
			<TR>
				<TH>Sender</TH>
				<td>
					<%
						String name = "";
						for (int j = 0; j < listUser.size(); j++) {
							if (listUser.get(j).getid() == message.getid_sender()) {
								name = listUser.get(j).getusername();
								break;
							}
						}
					%> <%=name%></td>
			</TR>
			<TR>
				<TH>Title</TH>
				<td><%=message.gettitle()%></td>
			</TR>
			<TR>
				<TH>Content</TH>
				<td><%=message.getcontent()%></td>
			</TR>
		</table>
	</div>
	<%
		String name_sender = name;
		session.setAttribute("name_sender", name_sender);
	%>
	<div class="centerDiv">
		<span><i class="fa fa-reply"> </i></span><span><a
			href="javascript:history.back()"><input type="button"
				value="Back"></a></span> <span><i class="fa fa-share"> </i></span><span><a
			href="Compose?name_sender=<%=name%>"><input type="button"
				value="Reply"></a></span>
	</div>
</body>
</html>