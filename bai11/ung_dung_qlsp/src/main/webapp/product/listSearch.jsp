<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/12/2023
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="webjars\bootstrap\5.2.3\css\bootstrap.css">
</head>
<body>
<table class="table">
  <thead>
  <tr>
    <th scope="col">Id</th>
    <th scope="col">Prodict Name</th>
    <th scope="col">Product Description</th>
    <th scope="col">Producer</th>
    <th scope="col">Product Price</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="product" items="${productById}">
    <tr>
      <td>${product.id}</td>
      <td>${product.productName}</td>
      <td>${product.productDescription}</td>
      <td>${product.producer}</td>
      <td>${product.productPrice}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<button><a href="/product">Back</a></button>


</body>
</html>
