<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 11/1/2023
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Delete</title>
</head>
<body>
<h1>Delete User</h1>
<p><a href="/user">Back to User List</a> </p>

<form action="/user?action=delete&id=${user.getId()}"method="post">
  <h3>Confirm delete</h3>
  <fieldset>
    <legend>Customer information</legend>
    <table>
      <tr>
        <td>Name</td>
        <td>${user.getName()}</td>
      </tr>
      <tr>
        <td>Email</td>
        <td>${user.getEmail()}</td>
      </tr>
      <tr>
        <td>Country</td>
        <td>${user.getCountry()}</td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete Product?"></td>
        <td><a href="/user">Back to User List</a></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>