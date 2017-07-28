<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webresources/common/header.jspf"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="wrapper">
    <%@ include file="/webresources/common/navigationbar.jspf"%>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Change password</b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/resetpassword" method="POST">
                                    <div class="form-group">
                                        <label for="username">Login</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z]+" title="Only latin letters" value="${userForm.username}" name="username" />
                                    </div>
                                    <c:if test="${user == true}">
                                        <div class="form-group">
                                            <label for="question">Secret question: ${userForm.question}</label>
                                            <input class="form-control" type="hidden" pattern="[a-zA-Z]+" title="Only latin letters" value="${userForm.question}" name="question" />
                                        </div>
                                        <div class="form-group">
                                            <label for="answer">Answer</label>
                                            <input class="form-control" type="text" pattern="[a-zA-Z]+" title="Only latin letters" value="" name="answer" />
                                        </div>
                                    </c:if>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
