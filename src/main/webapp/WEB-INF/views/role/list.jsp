<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webresources/common/header.jspf"%>

<div id="wrapper">
    <%@ include file="/webresources/common/navigationbar.jspf"%>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-lg-6"><h5><i class="fa fa-database fa-fw"></i> <b> User List</b></h5></div>
                            <div class="col-lg-6">
                                <div align="right">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="USER_TABLE">
                                <thead>
                                <tr>
                                    <th>User Id</th>
                                    <th>Login</th>
                                    <th>Admin</th>
                                    <th>Moder</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${USER_LIST}" var="USER">
                                    <tr>
                                        <td>${(USER.id)}</td>

                                        <td>${(USER.username)}</td>

                                        <td><a href="${contextPath}/superadmin/role/setadm/${USER.id}"><i class="fa fa-level-up fa-fw"></i>  Make admin</a></td>

                                        <td><a href="${contextPath}/superadmin/role/setmod/${USER.id}"><i class="fa fa-level-up fa-fw"></i>  Make moderator</a></td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <h4>Moderators</h4>
                            <table class="table table-striped table-bordered table-hover" id="USER_TABLE_1">
                                <thead>
                                <tr>
                                    <th>User Id</th>
                                    <th>Login</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${USER_MODER}" var="USER">
                                    <tr>
                                        <td>${(USER.id)}</td>
                                        <td>${(USER.username)}</td>
                                        <td><a href="${contextPath}/superadmin/role/remove/${USER.id}/2">Delete</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <h4>Administrators</h4>
                            <table class="table table-striped table-bordered table-hover" id="USER_TABLE_2">
                                <thead>
                                <tr>
                                    <th>User Id</th>
                                    <th>Login</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${USER_ADMIN}" var="USER">
                                    <tr>
                                        <td>${(USER.id)}</td>
                                        <td>${(USER.username)}</td>
                                        <td><a href="${contextPath}/superadmin/role/remove/${USER.id}/1">Delete</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <a href="${contextPath}/adm" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#USER_TABLE').DataTable({
            responsive: true
        });
        $('#USER_TABLE_1').DataTable({
            responsive: true
        });
        $('#USER_TABLE_2').DataTable({
            responsive: true
        });
    });
</script>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
