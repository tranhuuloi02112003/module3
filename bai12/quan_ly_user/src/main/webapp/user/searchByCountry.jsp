<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/18/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<form method="post" action="/user?action=searchByCountry">
  <div class="form-group row">
    <label class="col-4 col-form-label" for="country">Country:</label>
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
