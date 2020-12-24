<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForgetPassword</title>
<link rel="stylesheet" type="text/css" href="all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function check() {
		var email = document.formforget.email.value
		var pass = document.formforget.password.value
		var conpass = document.formforget.confirmpass.value
		if (email == '' || pass == '' || conpass == '') {
			alert('Khong duoc de trong')
			return false
		} else if(!(pass===conpass)){
		      alert('mat khau khong trung nhau')
		      return false
	    } else if (!(email.includes('@gmail.com'))) {
	        alert('khong dung la dinh dang Gmail')
	        return false
	    } else
			return true
	}
</script>
</head>
<body>
	<div class="topDiv">
		<h2>ForgetPassword Form</h2>
	</div>
	<form name="formforget" action="ForgetPassword" method="post"
		onsubmit="return check()">
		<table border="0" width="35%" align="center"">
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Confirm password:</td>
				<td><input type="password" name="confirmpass"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><span><i
						class="fa fa-reply"> </i></span><span><a
						href="javascript:history.back()"><input type="button"
							value="Back"></a></span><span><i class="fa fa-paper-plane">
					</i></span><input type="submit" name="forgetpass" value="OK"></td>
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