<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 11/1/2023
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user?action=create" method="post">
    <tr>
        <td>
            <span>Name:
            <input type="text" name="name">
            </span>
        </td>
    </tr>

    <tr>
        <td>
            <span>Email:
            <input type="text" name="email">
            </span>
        </td>
    </tr>

    <tr>
        <td>
            <span>Country:
            <input type="text" name="country">
            </span>
        </td>
    </tr>

    <tr>
        <td>
            <button type="submit">OK</button>
        </td>
    </tr>
</form>

    <a href="/user">Back</a>

</body>
</html>
