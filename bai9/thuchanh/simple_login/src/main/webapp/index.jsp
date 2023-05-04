<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        .login{
            width: 250px;
            height: 150px;
        }
        .login input{
            margin: 5px;
            padding: 5px; border:1px #CCC solid;
        }
    </style>
</head>
<body>
<form action="/login" method="post">
    <div class="login">
        <h2>Login</h2>
        <input type="text" name="username" size="30px" placeholder="username">
        <input type="text" name="password" size="30px" placeholder="password">
        <input type="submit" value="Sign in">
    </div>
</form>
</body>
</html>