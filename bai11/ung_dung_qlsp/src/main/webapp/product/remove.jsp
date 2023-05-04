<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/12/2023
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=remove" method="post">
    <h1>Nhập id cần xóa:</h1>
    <input type="text" placeholder="ID" name="idRemove">
    <button type="submit">Submit</button>
</form>


</body>
</html>
