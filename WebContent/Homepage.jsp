<%@page import="Model.BEAN.Message"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
</head>
<body>
	<div class="myDiv">
		<h2 align="center"><%=session.getAttribute("username") %>'s Mail</h2>
	</div>
	<table border="1" width="100%">
		<%
			ArrayList<Message> listMessage = (ArrayList<Message>) request.getAttribute("listMessage");
			if (listMessage.size() != 0) {
		%>
		<TR>
			<TH>Sender</TH>
			<TH>Title</TH>
			<TH>Time</TH>
			<th>Xoa</th>
		</TR>
		<%
			for (int i = 0; i < listMessage.size(); i++) {
		%>
		<tr>
			<td><%=listMessage.get(i).getid_sender()%></td>
			<td><%=listMessage.get(i).gettitle()%></td>
			<td><%=listMessage.get(i).getcreate_at()%></td>
			<td><input type="checkbox" name="check_list[]" value="<%=listMessage.get(i).getid() %>"></td>
		</tr>
		<%
			}
			} else {
		%>
		<center> <h3> Empty </h3> </center>
		<%
			}
		%>
	</table>
	<a href="Compose.jsp"><button>Send mail</button></a>
	<% String message = (String)request.getAttribute("alertMsg");%>
	<script type="text/javascript">
    	var msg = "<%=message %>";
    	if (msg!="null"&&msg!="")
    		alert(msg);
	</script>
</body>
</html>