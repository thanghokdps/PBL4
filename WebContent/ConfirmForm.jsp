<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="formconfirm" action="Confirm">
	<table align="center">
		<caption>Xac thuc qua email</caption>
		<tr>
			<th>Nhap ma code: </th>
			<th><input type="text" name="confirmcode"></th>
		</tr>
		<tr><td colspan="2" align="center"><input type="submit" name="confirm" value="OK"></td></tr>
	</table>
	<p><a href="javascript:history.back()">Go Back</a></p>
</form>
</body>
</html>