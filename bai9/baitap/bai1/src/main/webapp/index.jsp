<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        input {
            margin: 5px;
            padding: 4px;
        }
        .content{
            border: 1px solid black;
            font-size: 30px;
            width: 780px;
            margin: 5px auto;
        }

    </style>
</head>
<body>
<form action="/login" method="get">
    <div class="content">
        <h2>Ứng dụng Product Discount Calculator</h2>
        <label>Mô tả sản phẩm: </label><br/>
        <input type="text" name="productname" placeholder="Product Description"><br>
        <label>Giá niêm yết </label><br/>
        <input type="text" name="listprice" placeholder="List Price"><br>
        <label>Tỷ lệ chiết khấu </label><br/>
        <input type="text" name="discountpercent" placeholder="Discount Percent"><br>

        <input type="submit" value="Calculate Discount">
    </div>

</form>


</body>
</html>