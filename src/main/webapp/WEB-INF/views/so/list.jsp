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
                                    <!--a class="btn btn-primary btn-sm" href="new"><i class="fa fa-plus"></i> Add</a-->
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

                            <h4>Wait</h4>
                            <table class="table table-striped table-bordered table-hover" id="SO_TABLE_WAIT">
                                <thead>
                                <tr>
                                    <th>SOId</th>
                                    <th>SONumber</th>
                                    <th>Purchase Order Number</th>
                                    <th>Customer</th>
                                    <th>Order date</th>
                                    <th>Order date created</th>
                                    <th>Order date modified</th>
                                    <th>MP</th>
                                    <th>OTP</th>
                                    <th>Location</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${SO_WAIT}" var="SO">
                                    <tr>
                                        <td>${(SO.SOId)}</td>
                                        <td>${(SO.SONumber)}</td>
                                        <td>${(SO.purchaseOrderNumber)}</td>
                                        <td>${(SO.customer1.lastName)}</td>
                                        <td>${(SO.orderDate)}</td>
                                        <td>${(SO.dateCreated)}</td>
                                        <td>${(SO.dateModified)}</td>
                                        <td>${(SO.finalMPwithTaxAndDiscount)}</td>
                                        <td>${(SO.finalOTPwithTaxAndDiscount)}</td>
                                        <td>${(SO.location)}</td>
                                        <td><a href="${SO.SOId}"><i class="fa fa-level-up fa-fw"></i> More  </a>
                                        <c:if test="${empty SO.orderDate}">
                                            <a href="${contextPath}/admin/so/remove/${SO.SOId}"><i class="fa fa-level-up fa-fw"></i>  Delete</a>
                                        </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <h4>Ordered</h4>
                            <table class="table table-striped table-bordered table-hover" id="SO_TABLE_ORD">
                                <thead>
                                <tr>
                                    <th>SOId</th>
                                    <th>SONumber</th>
                                    <th>Purchase Order Number</th>
                                    <th>Customer</th>
                                    <th>Order date</th>
                                    <th>Order date created</th>
                                    <th>Order date modified</th>
                                    <th>MP</th>
                                    <th>OTP</th>
                                    <th>Location</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${SO_ORDERED}" var="SO">
                                    <tr>
                                        <td>${(SO.SOId)}</td>
                                        <td>${(SO.SONumber)}</td>
                                        <td>${(SO.purchaseOrderNumber)}</td>
                                        <td>${(SO.customer1.lastName)}</td>
                                        <td>${(SO.orderDate)}</td>
                                        <td>${(SO.dateCreated)}</td>
                                        <td>${(SO.dateModified)}</td>
                                        <td>${(SO.finalMPwithTaxAndDiscount)}</td>
                                        <td>${(SO.finalOTPwithTaxAndDiscount)}</td>
                                        <td>${(SO.location)}</td>
                                        <td><a href="${SO.SOId}"><i class="fa fa-level-up fa-fw"></i>  More</a>
                                            <a href="${contextPath}/admin/so/pays/${SO.SOId}"><i class="fa fa-level-up fa-fw"></i> Pays  </a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <h4>All Statuses</h4>
                            <table class="table table-striped table-bordered table-hover" id="SO_TABLE">
                                <thead>
                                <tr>
                                    <th>SOId</th>
                                    <th>SONumber</th>
                                    <th>Status</th>
                                    <th>Purchase Order Number</th>
                                    <th>Customer</th>
                                    <th>Order date</th>
                                    <th>Order date created</th>
                                    <th>Order date modified</th>
                                    <th>MP</th>
                                    <th>OTP</th>
                                    <th>Location</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${SOES}" var="SO">
                                    <tr>
                                        <td>${(SO.SOId)}</td>
                                        <td>${(SO.SONumber)}</td>
                                        <td>${(SO.status)}</td>
                                        <td>${(SO.purchaseOrderNumber)}</td>
                                        <td>${(SO.customer1.lastName)}</td>
                                        <td>${(SO.orderDate)}</td>
                                        <td>${(SO.dateCreated)}</td>
                                        <td>${(SO.dateModified)}</td>
                                        <td>${(SO.finalMPwithTaxAndDiscount)}</td>
                                        <td>${(SO.finalOTPwithTaxAndDiscount)}</td>
                                        <td>${(SO.location)}</td>
                                        <td><a href="${SO.SOId}"><i class="fa fa-level-up fa-fw"></i> More  </a>
                                        <a href="${contextPath}/admin/so/pays/${SO.SOId}"><i class="fa fa-level-up fa-fw"></i> Pays  </a>
                                            <c:if test="${empty SO.orderDate}">
                                                <a href="${contextPath}/admin/so/remove/${SO.SOId}"><i class="fa fa-level-up fa-fw"></i>  Delete</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>



                    </div>
                    <a href="${contextPath}/adm" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
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
    $(document).ready(function(){
        $('#SO_TABLE').dataTable();
        $('#SO_TABLE_ORD').dataTable();
        $('#SO_TABLE_WAIT').dataTable();
    });
</script>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
