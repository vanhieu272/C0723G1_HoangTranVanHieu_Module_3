<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 10/30/2023
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        img{
            width: 60px;
            height: 80px;
        }
    </style>
</head>
<body>
    <table class="table table-dark table-hover">
        <tr>
            <th>Name</th>
            <th>Date of birth</th>
            <th>Address</th>
            <th>Image</th>
        </tr>
        <c:forEach items="${customerList}" var="customer" varStatus="status">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.dob}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.image}" alt=""></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
