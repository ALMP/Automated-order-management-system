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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Group 1 info</b></h5>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE">
                            <thead>
                            <tr>
                                <th>Item Id</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Def MP</th>
                                <th>Def OTP</th>
                                <th>Modified Date</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ITEM_LIST}" var="I">
                                    <tr>
                                        <td>${I.itemId}</td>
                                        <td>${I.name}</td>
                                        <td>${I.type}</td>
                                        <td>${I.description}</td>
                                        <td>${I.defMP}</td>
                                        <td>${I.defOTP}</td>
                                        <td>${I.modifiedDate}</td>
                                        <td><a href="${contextPath}/admin/group/removeitem/${GROUP.groupId}/${I.itemId}">Delete</a></td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE_1">
                            <thead>
                            <tr>
                                <th>Item Id</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Def MP</th>
                                <th>Def OTP</th>
                                <th>Modified Date</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${NITEM_LIST}" var="I">
                                <tr>
                                    <td>${I.itemId}</td>
                                    <td>${I.name}</td>
                                    <td>${I.type}</td>
                                    <td>${I.description}</td>
                                    <td>${I.defMP}</td>
                                    <td>${I.defOTP}</td>
                                    <td>${I.modifiedDate}</td>
                                    <td><a href="${contextPath}/admin/group/additem/${GROUP.groupId}/${I.itemId}">Add</a></td>

                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <a href="${contextPath}/admin/group/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
</div>
<script>
    $(document).ready(function () {
        $('#ITEM_TABLE').DataTable({
            responsive: true
        });
        $('#ITEM_TABLE_1').DataTable({
            responsive: true
        });
    });
</script>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
