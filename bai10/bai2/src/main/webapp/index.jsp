<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<%--<a href="hello-servlet">Hello Servlet</a>--%>
<form action="/calculator" method="get">
    <h1>Simple Calculator</h1>
    <fieldset>
        <legend>Calculator</legend>
        <table >
            <tr>
                <td>First operand:</td>
                <td><input type="text" name="first_operand"></td>
            </tr>
            <tr>
                <td>Calculation:</td>
                <td>
                    <select name="calculation" id="">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand</td>
                <td><input type="text" name="second_operand"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculate"></td>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>