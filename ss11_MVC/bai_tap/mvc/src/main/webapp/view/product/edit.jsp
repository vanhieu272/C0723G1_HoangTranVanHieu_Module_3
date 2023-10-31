
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
    <title>Edit page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<p>
    <c:if test="${mess != null}">
        <span class="message">${mess}</span>
    </c:if>
</p>

<form method="post">
    <fieldset>
        <legend>Edit product</legend>
        <table>
            <tr>
                <td>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text">Name:</span>
                        <input type="text" name="name" id="name" value="${product.name}" class="form-control"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text">Price:</span>
                        <input type="text" name="price" id="price" value="${product.price}" class="form-control"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
                </td>

            </tr>
            <tr>
                <td>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text">Description:</span>
                        <input type="text" name="description" id="description" value="${product.description}" class="form-control"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text">Producer:</span>
                        <input type="text" name="producer" id="producer" value="${product.producer}" class="form-control"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
                </td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
