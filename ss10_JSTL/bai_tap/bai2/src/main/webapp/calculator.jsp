<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 10/30/2023
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>


<form action="calculatorServlet" method="get" style="width: 20%">
    <div class="input-group input-group-sm">
        <span class="input-group-text" id="inputGroup-sizing-sm">First operand: </span>
        <input type="number" name="num1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
    </div>
    <span class="input-group-text" id="inputGroup-sizing-sm1">Operator: </span>
    <select class="form-select" name="operator" aria-label="Default select example">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>
    <div class="input-group input-group-sm">
        <span class="input-group-text" id="inputGroup-sizing-sm2">Second operand: </span>
        <input type="number" name="num2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
    </div>
    <button type="submit" class="btn btn-primary">Calculate</button>
</form>

</body>
</html>
