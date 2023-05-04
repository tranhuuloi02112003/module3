
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="webjars\bootstrap\5.2.3\css\bootstrap.css">
  <style>
    .chucnang ul{
      display: flex;
    }
    .chucnang ul li{
      list-style: none;
      margin: 0px 10px;
    }
    .chucnang ul li a{
      text-decoration: none;
    }
  </style>
</head>
<body>
<h1>Thông tin sản phẩm</h1>
<table class="table">
  <thead>
  <tr>
    <th scope="col">Id</th>
    <th scope="col">Prodict Name</th>
    <th scope="col">Product Description</th>
    <th scope="col">Producer</th>
    <th scope="col">Product Price</th>
    <th colspan="2">Chức năng</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="product" items="${productList}">
    <tr>
      <td>${product.id}</td>
      <td>${product.productName}</td>
      <td>${product.productDescription}</td>
      <td>${product.producer}</td>
      <td>${product.productPrice}</td>
      <td><a href="/product?action=edit&id=${product.id}">Edit</a></td>
      <td><a href="/product?action=remove&id=${product.id}">Remove</a></td>
    </tr>
   </c:forEach>

  </tbody>
</table>


<div class="chucnang">
  <ul>
    <li>Chức năng:</li>
    <li><a href="/product?action=create" role="button" >Create</a></li>
    <li><a href="/product?action=edit" role="button" >Edit</a></li>
    <li><a href="/product?action=remove" role="button" >Remove</a></li>
    <li><a href="/product?action=search" role="button" >Search</a></li>
  </ul>
</div>


</body>
</html>
