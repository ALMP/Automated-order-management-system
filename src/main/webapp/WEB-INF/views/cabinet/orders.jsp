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
                            <div class="col-lg-6"><h5><i class="fa fa-database fa-fw"></i> <b> So List</b></h5></div>
                            <div class="col-lg-6">
                                <div align="right">
                                    <a class="btn btn-primary btn-sm" href="new"><i class="fa fa-plus"></i> Add</a>
                                    <c:if test="${not empty requestScope.SO_LIST}">
                                        <button class="btn btn-default btn-sm" onclick="javascript:window.print()">
                                            <i class="fa fa-print fa-fw"></i> Print So list
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="SO_TABLE">
                                <thead>
                                <tr>
                                    <th>SOId</th>
                                    <th>Date Created</th>
                                    <th>Order Date</th>
                                    <th>Status</th>
                                    <th>SONumber</th>
                                    <th>Purchase Order Number</th>
                                    <th>Date Modified</th>
                                    <th>Customer</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${SO_LIST}" var="SO">
                                    <tr>
                                        <td>${(SO.SOId)}</td>

                                        <td>${(SO.dateCreated)}</td>

                                        <td>${(SO.orderDate)}</td>

                                        <td>${(SO.status)}</td>

                                        <td>${(SO.SONumber)}</td>

                                        <td>${(SO.purchaseOrderNumber)}</td>

                                        <td>${(SO.dateModified)}</td>

                                        <td>${(SO.customer1.lastName)}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>





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
        $('#SO_TABLE').DataTable({
            responsive: true
        });
    });
</script>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
