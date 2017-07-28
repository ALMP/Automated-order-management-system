<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 03.01.2017
  Time: 0:27
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
    <h3>Payment summary - ${value}$</h3>
    <br>
    <div class="list-group-item">
        <c:forEach items="${Accounts}" var="account">
        <form role="form" action="${contextPath}/payments/payit" method="GET">
            <label>${account.name} : ${account.accountNumber}</label>
            <input class="form-control" type="hidden" name="accountnumber" value="${account.accountNumber}"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Pay it!</button>
            <h3>Balance value: ${account.balance}</h3>
        </form>
        </c:forEach>
    </div>
</body>
</html>
