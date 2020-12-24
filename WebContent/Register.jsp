<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="topDiv">
		<h2>Register Form</h2>
	</div>
	<form name="formregister" action="Register" method="post">
		<table border="0" width="35%" align="center"">
			<tr>
				<td width="50%">Email:</td>
				<td><input type="text" name="email" size="50"></td>
			</tr>

			<tr>
				<td>Username:</td>
				<td><input type="text" name="username" size="50"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" size="50"></td>
			</tr>
			<tr>
				<td>Confirm password:</td>
				<td><input type="password" name="confirmpass" size="50"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><span><i
						class="fa fa-reply"> </i></span><span><a
						href="javascript:history.back()"><input type="button"
							value="Back"></a></span><span><i class="fa fa-paper-plane">
					</i></span><input type="submit" name="register" value="Register"></td>
			</tr>
		</table>
	</form>
</body>
</html>
<% String message = (String)request.getAttribute("alertMsg");%>
<script type="text/javascript">
   	var msg = "<%=message %>";
   	if (msg!="null"&&msg!="")
   		alert(msg);
</script>