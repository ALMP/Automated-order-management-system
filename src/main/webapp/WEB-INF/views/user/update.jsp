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
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Update User</b></h5> 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/user/update" method="POST">

                                    <div class="form-group">
                                        <label for="userId">User Id</label>
                                        <input class="form-control" type="number" name="userId" readonly value="${USER.userId}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="login">Login</label>
                                        <input class="form-control" type="text" name="login"  value="${USER.login}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z0-9]+" name="password"  value="${USER.password}" />
                                    </div>

                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                    <a href="${contextPath}/admin/user/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
