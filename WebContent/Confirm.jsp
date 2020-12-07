<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm</title>
<link rel="stylesheet" type="text/css" href="all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class=topDiv>
		<h2>
			Confirm
			<%=session.getAttribute("username")%>
		</h2>
	</div>
	<form name="formconfirm" action="Confirm">
		<table align="center">
			<tr>
				<th>Enter the code:</th>
				<th><input type="text" name="confirmcode"></th>
			</tr>
			<tr>
				<td colspan="2" align="center"><span><i
						class="fa fa-reply"> </i></span><span><a
						href="javascript:history.back()"><input type="button"
							value="Back"></a></span><span><i class="fa fa-paper-plane">
					</i></span><input type="submit" name="confirm" value="OK"></td>
			</tr>
		</table>
	</form>
</body>
</html>