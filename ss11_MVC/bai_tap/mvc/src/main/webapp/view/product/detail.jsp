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
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>

<table>
    <tr>
        <td>Name: ${product.name}</td>
    </tr>
    <tr>
        <td>Price: ${product.price}</td>
    </tr>
    <tr>
        <td>Description: ${product.desciption}</td>
    </tr>
    <tr>
        <td>Producer: ${product.producer}</td>
    </tr>
    <tr>
            <a href="/product">Back</a>
    </tr>
</table>
</body>
</html>
