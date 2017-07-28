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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Groups</b></h5>
                    </div>
                    <div class="panel-body">
                        <h4>To remove the item from the group</h4>
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE">
                            <thead>
                            <tr>
                                <th>Group Id</th>
                                <th>Name</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${GROUP_LIST}" var="G">
                                    <tr>
                                        <td>${G.groupId}</td>
                                        <td>${G.name}</td>
                                        <td><a href="${contextPath}/admin/item/removegroup/${ITEM.itemId}/${G.groupId}">Remove</a></td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <h4>Add the item to the group</h4>
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE_1">
                            <thead>
                            <tr>
                                <th>Group Id</th>
                                <th>Name</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${NGROUP_LIST}" var="G">
                                <tr>
                                    <td>${G.groupId}</td>
                                    <td>${G.name}</td>
                                    <td><a href="${contextPath}/admin/item/add/${ITEM.itemId}/${G.groupId}">Add</a></td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>



                        <a href="${contextPath}/admin/item/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>

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
