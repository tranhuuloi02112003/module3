<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/12/2023
  Time: 10:37 AM
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
<h1>Edit</h1>
<form action="/product?action=edit" method="post">
    <div class="form-group row">
        <label for="id" class="col-4 col-form-label">ID:</label>
        <div class="col-8">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-id-card-o"></i>
                    </div>
                </div>
                <input id="id" name="id" placeholder="Nhập id cần edit" type="text" class="form-control" value="${id}">
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="name" class="col-4 col-form-label">Product name:</label>
        <div class="col-8">
            <input id="name" name="name" placeholder="Nhập tên sp" type="text" class="form-control" value="${name}">
        </div>
    </div>
    <div class="form-group row">
        <label for="description" class="col-4 col-form-label">Product description:</label>
        <div class="col-8">
            <input id="description" name="description" placeholder="Mô tả sp" type="text" class="form-control" value="${description}">
        </div>
    </div>
    <div class="form-group row">
        <label for="producer" class="col-4 col-form-label">Producer:</label>
        <div class="col-8">
            <input id="producer" name="producer" placeholder="Nhập nhà sx" type="text" class="form-control" value="${producer}">
        </div>
    </div>
    <div class="form-group row">
        <label for="frice" class="col-4 col-form-label">Product frice:</label>
        <div class="col-8">
            <input id="frice" name="frice" placeholder="Nhập giá sp" type="text" class="form-control" value="${frice}">
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
