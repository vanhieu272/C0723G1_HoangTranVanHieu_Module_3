<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 10/31/2023
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
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
        <td>Note: </td>
        <td>${product.note}</td>
    </tr>
    <tr>
        <td>Manufacturer: </td>
        <td>${product.manufacturer}</td>
    </tr>
</table>
</body>
</html>
