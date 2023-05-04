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
</head>
<body>
<h1>Nhập thông tin người dùng</h1>
<form action="/user?action=create" method="post">
    <div class="form-group row">
        <label for="id" class="col-4 col-form-label">ID:</label>
        <div class="col-8">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-id-card-o"></i>
                    </div>
                </div>
                <input id="id" name="id" placeholder="Nhập id" type="text" class="form-control">
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="name" class="col-4 col-form-label">User name:</label>
        <div class="col-8">
            <input id="name" name="name" placeholder="Nhập tên người dùng" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="email" class="col-4 col-form-label">User email:</label>
        <div class="col-8">
            <input id="email" name="email" placeholder="Nhập email" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="country" class="col-4 col-form-label">Country:</label>
        <div class="col-8">
            <input id="country" name="country" placeholder="Nhập quốc gia" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <div class="offset-4 col-8">
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
</form>


</body>
</html>
