<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 10/31/2023
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Searching page</title>
</head>
<body>
<h1>Product: ${name}</h1>

<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Note</td>
        <td>Manufacturer</td>
        <td>Detail</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.note}</td>
            <td>${product.manufacturer}</td>
            <td><a href="/product?action=detail&id=${product.getId()}">Detail</a></td>
            <td><a href="/product?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
