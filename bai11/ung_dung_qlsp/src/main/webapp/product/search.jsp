<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/12/2023
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<form action="/product?action=search" method="post">
    <h1>Tìm theo id:</h1>
    <input type="text" name="searchById" id="" placeholder="Nhập id:">
    <button type="submit">Submit</button>
</form>

</body>
</html>
