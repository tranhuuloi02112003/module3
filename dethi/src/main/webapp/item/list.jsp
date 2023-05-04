<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thư viện c--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"
          crossorigin="anonymous">
    <style>
        div a{
            text-decoration: none;
            color: #0c0c0c;
            font-size: 20px;
        }
        a:hover{
            color: blue;
            font-size: 23px;
        }
    </style>
</head>
<body>
<h1 style="text-align: center;color: red">Product Information</h1>
<div>
    <a href="/item?action=create" role="button">Add Product</a>
    <form action="/item?action=search" method="post">
        <input type="text" name="search" placeholder="Nhập id cần tìm">
        <input type="submit" value="Search">
    </form>
    <form action="/item?action=relativeSearch" method="post">
        <input type="text" name="relativeSearch" placeholder="Nhập thông tin muốn tìm gần đúng">
        <input type="submit" value="Search">
    </form>
</div>
<table class="table" id="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Color</th>
        <th scope="col">Category Name</th>
        <th>Chức năng</th>
        <th>Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="value" items="${list}">
        <tr>
            <td>${value.idPro}</td>
            <td>${value.namePro}</td>
            <td>${value.price}</td>
            <td>${value.color}</td>
            <td>${value.nameCategory}</td>
            <td><a href="/item?action=edit&id=${value.idPro}">Edit</a></td>
            <td>
                <button onclick="showModelDelete('${value.idPro}','${value.namePro}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Ban muon xoa: <span id="productName" style="color: red"></span> ?</p>
            </div>
            <div class="modal-footer">
                <form action="/item" method="get">
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
                <form action="/item" method="get">
                    <input type="hidden" name="action" value="remove">
                    <input type="hidden" name="id" value="" id="productId">
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        $('#table').dataTable({
            'pageLength' : 7,
            'searching' : false
        })
    })

    function showModelDelete(id, name) {
        console.log(id, name);
        document.getElementById("productName").innerText = name;
        document.getElementById("productId").value = id;
    }
</script>

</body>
</html>
