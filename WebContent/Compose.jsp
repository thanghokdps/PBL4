<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Compose</title>
<link rel="stylesheet" type="text/css" href="all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
		String name_sender = (String) request.getAttribute("name_sender");
		if (name_sender == null) {
			name_sender = "";
		}
	%>
	<div class=topDiv>
		<h2>Send New E-mail</h2>
	</div>
	<form action="Compose" name="compose mail" method="post">
		<table border="0" width="35%" align="center">
			<tr>
				<td width="50%">To:</td>
				<td><input type="text" name="receiver" size="50"
					value="<%=name_sender%>" /></td>
			</tr>
			<tr>
				<td>Title:</td>
				<td><input type="text" name="title" size="50" /></td>
			</tr>
			<tr>
				<td>Content:</td>
				<td><textarea rows="10" cols="39" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><span><i
						class="fa fa-reply"> </i></span><span><a
						href="javascript:history.back()"><input type="button"
							value="Back"></a></span><span><i class="fa fa-paper-plane">
					</i></span><input type="submit" value="Send" /></td>
			</tr>
		</table>
	</form>
</body>
</html>