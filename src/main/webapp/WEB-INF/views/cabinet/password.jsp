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
                                <form role="form" action="${contextPath}/cabinet/password" method="POST">
                                    <div class="form-group">
                                        <label for="userPassword1">Old password</label>
                                        <input class="form-control" pattern="[a-zA-Z]+" title="Only latin letters" type="password" name="name1" />
                                    </div>
                                    <div class="form-group">
                                        <label for="userPassword2">New password</label>
                                        <input class="form-control" pattern="[a-zA-Z]+" title="Only latin letters" type="password" name="name2" />
                                    </div>
                                    <div class="form-group">
                                        <label for="userPassword3">Repeat new password</label>
                                        <input class="form-control" pattern="[a-zA-Z]+" title="Only latin letters" type="password" name="name3" />
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                    <a href="${contextPath}/cabinet/cabinet" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
