<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="formregister" action="Register" method="post">
	<table align="Center">
            <caption>Register form</caption>
            <tr >
                <td>Email:</td>
                <td><input type="text" name="email" ></td>
            </tr>
            
            <tr >
                <td>Username:</td>
                <td><input type="text" name="username" ></td>
            </tr>
            <tr >
                <td>Password:</td>
                <td><input type="password" name="password" ></td>
            </tr>
            <tr >
                <td>Confirm password:</td>
                <td><input type="text" name="confirmpass" ></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="register" value="Register">
                </td>
            </tr>
        </table>
        <p><a href="javascript:history.back()">Go Back</a></p>
</form>
</body>
</html>