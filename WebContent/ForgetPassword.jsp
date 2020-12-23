<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function check() {
	var email = document.formforget.email.value
	var pass = document.formforget.password.value
	var conpass = document.formforget.confirmpass.value
	if (email =='' || pass =='' || conpass=='') {
		alert('Khong duoc de trong')
		return false
	}
	else if(!pass.equals(conpass)){
		alert('mat khau khong trung nhau')
		return false
	}
	else return true
}
</script>
</head>
<body>
	<form name="formforget" action="ForgetPassword" method="post" onsubmit="return check()">
	<table align="Center">
            <tr >
                <td>Email:</td>
                <td><input type="text" name="email" ></td>
            </tr>
            <tr >
                <td>Password:</td>
                <td><input type="password" name="password" ></td>
            </tr>
            <tr >
                <td>Confirm password:</td>
                <td><input type="password" name="confirmpass" ></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="forgetpass" value="OK">
                </td>
            </tr>
        </table>
        <p><a href="javascript:history.back()">Go Back</a></p>
</form>
</body>
</html>