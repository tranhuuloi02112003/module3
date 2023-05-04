<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="webjars\bootstrap\5.2.3\css\bootstrap.css">
    <style>
        .chucnang ul {
            display: flex;
        }

        .chucnang ul li {
            list-style: none;
            margin: 0px 10px;
        }

        .chucnang ul li a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<h1>Thông tin người dùng</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Country</th>
        <th colspan="2">Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/user?action=edit&id=${user.id}">Edit</a></td>
            <td><a href="/user?action=remove&id=${user.id}">Remove</a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>


<div class="chucnang">
    <ul>
        <li>Chức năng:</li>
        <li><a href="/user?action=create" role="button">Create</a></li>
        <li><a href="/user?action=searchByCountry" role="button">Search By Country</a></li>
        <li><a href="/user?action=sortByName&q=${search}" role="button">Sort By Name</a></li>
    </ul>
</div>


</body>
</html>
