<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02.01.2017
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webresources/common/header.jspf"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2 class="form-heading">Log in</h2>
<form method="POST" action="${contextPath}/payments/paylogin" class="form-signin">
    <div class="form-group">
        <input name="login" type="text" class="form-control" required placeholder="Username"
               autofocus="true"/>
        <input name="password" type="password" class="form-control" required placeholder="Password"/>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
        <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
    </div>
</form>
</body>
</html>
