<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Product Discount Calculator</title>
</head>
<body>
<form action="/discount" method="post">
    <h1>Description</h1><br/>
    <input type="text" name="des" placeholder="description product"><br/>
    <h1>List Price</h1><br/>
    <input type="number" name="price" placeholder="0.00"><br/>
    <h1>Discount Percent</h1><br/>
    <input type="number" name="discount" placeholder="%"><br/>
    <input type="submit" value="count" id="submit">
</form>
</body>
</html>