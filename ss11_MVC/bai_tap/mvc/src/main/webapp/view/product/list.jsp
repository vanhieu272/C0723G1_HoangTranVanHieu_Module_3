<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 10/31/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Products Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Products Management</h1>
<p>
    <a href="/product?action=create">Add new product</a>
</p>
<form action="/product">
    <input type="text" name="action" value="search" hidden="hidden">
    <input type="text" name="name">
    <button type="submit">Search</button>
</form>
<table class="table table-dark table-hover px-5">
    <th>No.</th>
    <th>Name</th>
    <th>Price</th>
    <th>Description</th>
    <th>Producer</th>
    <th>Show detail</th>
    <th>Edit</th>
    <th>Delete</th>
    <c:forEach items="${productList}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.producer}</td>
            <td><a href="/product?action=detail&id=${product.getId()}">Detail</a></td>
            <td><a href="/product?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
