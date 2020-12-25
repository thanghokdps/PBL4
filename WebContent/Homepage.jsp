<%@page import="Model.BEAN.User"%>
<%@page import="Model.BEAN.Message"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<link rel="stylesheet" type="text/css" href="all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%
	String userName = String.valueOf(session.getAttribute("name"));
	session.setAttribute("userName", userName);
	String passWord = String.valueOf(session.getAttribute("pass"));
	session.setAttribute("passWord", passWord);
	String id_user = String.valueOf(session.getAttribute("id"));
	session.setAttribute("id_user", id_user);
%>
<body>
	<div class="topDiv">
		<h2 align="center"><%=session.getAttribute("name")%>'s InBox
		</h2>
	</div>
	<div class="centerDiv">
		<form action="SearchMessage" method="POST">
			<span> LOOK FOR INFORMATION : </span><span><input type="text"
				width="35%" name="search"></span> <span><i
				class="fa fa-search"></i></span> <span><input type="submit"
				value="Search"></span>
		</form>
	</div>
	<form action="DeleteMessage" method="POST">
		<table border="1" width="100%">
			<%
				ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
			%>
			<%
				ArrayList<Message> listMessage = (ArrayList<Message>) request.getAttribute("listMessage");
				if (listMessage.size() != 0) {
			%>
			<TR>
				<TH></TH>
				<TH>Sender</TH>
				<TH>Title</TH>
				<TH>Time</TH>
				<TH></TH>
			</TR>
			<%
				for (int i = 0; i < listMessage.size(); i++) {
			%>
			<tr>
				<td align='center'><input type="checkbox" name="listDelete"
					id="listDelete" value="<%=listMessage.get(i).getid()%>"></td>
				<td>
					<%
						String name = "";
								for (int j = 0; j < listUser.size(); j++) {
									if (listUser.get(j).getid() == listMessage.get(i).getid_sender()) {
										name = listUser.get(j).getusername();
										break;
									}
								}
					%> <%=name%>
				</td>
				<td><%=listMessage.get(i).gettitle()%></td>
				<td><%=listMessage.get(i).getcreate_at()%></td>
				<td align='center'><a
					href="ShowMessage?id_mess=<%=listMessage.get(i).getid()%>"><i
						class="fa fa-eye"></i></a></td>
			</tr>
			<%
				}
			%>
		</table>
		<div class="centerDiv">
			<span><i class="fa fa-trash"></i></span><span><input
				type="submit" name="btnDel" value="Delete"
				onclick="return confirm('Are you sure?')"></span>
		</div>
	</form>
	<div class="centerDiv">
		<span> <i class="fa fa-plus-square"></i>
		</span> 
		<span><a href="Compose.jsp"> <input type="button" name="btAdd" value="Compose"></a> </span>
		<span><a href="MessageSent"> <input type="button" name="btSent" value="Sent"></a> </span>
	</div>
	<%
		} else {
	%>
	<div class="centerDiv">
		<h3>Empty</h3>
		<a href="Compose.jsp"> <i class="fa fa-plus-square"></i><input
			type="button" name="btAdd" value="Compose"></a>
		<a href="MessageSent"> <i class="fa fa-plus-square"></i><input
			type="button" name="btSent" value="Sent"></a>
	</div>
	<%
		}
	%>
	<form action="Authenticate" name="refesh" id="refesh" method="POST">
	</form>
</body>
</html>

<script type="text/javascript">
	var auto_refresh = setInterval(function() {
		submitform();
	}, 15000);

	function submitform() {
		var checkboxes = document.getElementsByName("listDelete");
		var checkboxesChecked = [];
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked == true) {
				var check = true;
			}
		}

		if (check != true) {
			document.getElementById("refesh").submit();
		}
	}
</script>
<% String message = (String)request.getAttribute("alertMsg");%>
<script type="text/javascript">
   	var msg = "<%=message %>";
   	if (msg!="null"&&msg!="")
   		alert(msg);
</script>
