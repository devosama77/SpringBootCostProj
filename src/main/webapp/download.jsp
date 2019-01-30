<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/1/2018
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <title>Download Page</title>
</head>
<body>
<security:authorize access="isAuthenticated()">
    <a href="logout">Logout</a>
<srping:url value="/download?type=xlsx" var="xlsUrl" ></srping:url>

<div class="list-group">
<a href="${xlsUrl}" class="list-group-item">
    <h4 class="list-group-item-heading">Excel Download</h4>
</a>
<%--<a href="${xlsUrl}"target="_blank">PDF Download</a>--%>
    <srping:url value="/download?type=pdf" var="pdfUrl"></srping:url>
    <a href="${pdfUrl}" class="list-group-item">
        <h4 class="list-group-item-heading">PDF Download</h4>
    </a>
</div>
</security:authorize>
</body>
</html>
