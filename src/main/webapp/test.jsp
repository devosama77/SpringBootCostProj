<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/12/2017
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TEst</title>
</head>
<body>
<srping:url value="/download?type=xlsx" var="xlsUrl"></srping:url>
<a href="${xlsUrl}" target="_blank">Excel Download</a>
<a href="${xlsUrl}"target="_blank">PDF Download</a>
<br><br>
</body>
</html>
