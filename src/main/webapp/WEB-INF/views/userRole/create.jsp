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
                        <h5><i class="fa fa-plus-square fa-fw"></i> <b> Create a new User Role </b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/userRole/new" method="POST">
                                    <div class="form-group">
                                        <label for="userRoleId">Id</label>
                                        <input class="form-control" type="number" name="userRoleId" path="userRoleId"  required="required" autofocus="autofocus"  />
                                    </div>
                                    <div class="form-group">
                                        <label>Role</label>
                                        <select path="role1" name="role1" onchange=" ">
                                            <option value="ord_null">Нет</option>
                                            <c:forEach items="${ROLE_LIST}" var="ROLE">
                                                <option value="${ROLE.roleId}">${ROLE.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>User</label>
                                        <select path="user1" name="user1" onchange=" ">
                                            <option value="ord_null">Нет</option>
                                            <c:forEach items="${USER_LIST}" var="USER">
                                                <option value="${USER.userId}">${USER.login}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="id">UserRole Id</label>
                                        <input class="form-control" type="number" name="userId" path="userId"  required="required" autofocus="autofocus"  />
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Submit</button>
                                    <a href="${contextPath}/admin/userRole/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
