<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/14/2023
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        select{
            width: 1440px;
            height: 38px;
        }
    </style>
</head>
<body>
<h1>Nhập thông tin</h1>
<form action="/item?action=create" method="post">
<%--    <div class="form-group row">--%>
<%--        <label for="id" class="col-4 col-form-label">ID:</label>--%>
<%--        <div class="col-8">--%>
<%--            <div class="input-group">--%>
<%--                <div class="input-group-prepend">--%>
<%--                    <div class="input-group-text">--%>
<%--                        <i class="fa fa-id-card-o"></i>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <input  id="id" name="id" placeholder="Nhập id" type="hidden" class="form-control">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="form-group row">
        <label for="name" class="col-4 col-form-label">Name:</label>
        <div class="col-8">
            <input id="name" name="name" placeholder="Nhập tên" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="price" class="col-4 col-form-label">Price:</label>
        <div class="col-8">
            <input id="price" name="price" placeholder="Nhập giá" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="color" class="col-4 col-form-label">Color:</label>
        <div class="col-8">
            <input id="color" name="color" placeholder="Nhập màu" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="nameCategory" class="col-4 col-form-label">Name Category:</label>
        <div class="col-8">
            <select name="nameCategory" id="nameCategory">
                <option value="New">New</option>
                <option value="Old">Old</option>
            </select>
<%--            <input id="nameCategory" name="nameCategory" placeholder="Nhập tên loại" type="text" class="form-control">--%>
        </div>
    </div>
    <div class="form-group row">
        <div class="offset-4 col-8">
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            <button  type="button" class="btn btn-primary"><a href="/item" style="color: white">Back</a></button>
        </div>
    </div>
</form>


</body>
</html>
