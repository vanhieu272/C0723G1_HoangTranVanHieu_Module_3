<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 10/31/2023
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        input{
            margin-left: 50px ;
        }
    </style>
</head>
<body>
<p>
    <c:if test="${mess != null}">
        <span class="message">${mess}</span>
    </c:if>
</p>


<form method="post">
    <fieldset>
        <legend>Add new product</legend>
        <table>
            <tr>
                <td>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text">Name:</span>
                        <input type="text" name="name" id="name" class="form-control"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="input-group flex-nowrap">
                    <span class="input-group-text">Price:</span>
                    <input type="text" name="price" id="price" class="form-control"
                           aria-label="Username" aria-describedby="addon-wrapping">
                </div>
                </td>
            </tr>
            <tr>

                <td>
                    <div class="input-group flex-nowrap">
                    <span class="input-group-text">Description:</span>
                    <input type="text" name="description" id="description" class="form-control"
                           aria-label="Username" aria-describedby="addon-wrapping">
                </div>
            </tr>
            <tr>

                <td>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping">Producer:</span>
                        <input type="text" name="producer" id="producer" class="form-control"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
            </tr>
            <tr>
                <td><button type="submit">OK</button></td>
            </tr>
            <tr>
                <td><a href="/product">Back</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
