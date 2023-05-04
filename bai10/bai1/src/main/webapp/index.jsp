<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        table{
            border: 1px solid black;
        }
    </style>
</head>

<body>
    <h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
   <tbody>
   <c:forEach items="${students}" var="s">
       <tr>
           <th>${s.name}</th>
           <th>${s.dateOfBirth}</th>
           <th>${s.address}</th>
           <th><img src="img/${s.image}" alt="" width="30px"></th>
       </tr>
   </c:forEach>
   </tbody>

</table>
</body>
</html>