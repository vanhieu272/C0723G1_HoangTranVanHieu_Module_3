<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 10/31/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete page</title>
</head>
<body>
<h1>Delete product</h1>

<form method="post">
    <h3>Are you sure want to delete this product?</h3>
    <table>
        <tr>
            <td>Name: </td>
            <td>${product.name}</td>
        </tr>
        <tr>
            <td>Price: </td>
            <td>${product.price}</td>
        </tr>
        <tr>
            <td>Description: </td>
            <td>${product.description}</td>
        </tr>
        <tr>
            <td>Producer: </td>
            <td>${product.producer}</td>
        </tr>
        <tr>
            <td><input type="submit" value="Delete product"></td>
            <td><a href="/product">Back to product list</a></td>
        </tr>
    </table>
</form>
</body>
</html>
