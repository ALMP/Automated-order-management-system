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
                            <c:forEach items="${SO_LIST}" var="SO">
                                <c:if test="${fn:contains(SO.attentionFlag, 'Waiting for payment')}">
                                    <label>Please, pay the order ${SO.SONumber}</label>
                                    <br>
                                    <c:if test="${fn:contains(SO.attentionFlag, 'Waiting for payment')}">
                                        <label><a href="order/${SO.customer1.customerId}/${SO.SOId}"><i class="fa fa-level-up fa-fw"></i>  Pay</a></label>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <table class="table table-striped table-bordered table-hover" id="SO_TABLE">
                                <thead>
                                <tr>
                                    <th>SONumber</th>
                                    <th>Customer</th>
                                    <th>Customer e-mail</th>
                                    <th>Status</th>
                                    <th>Location</th>
                                    <th>Purchase Order Number</th>
                                    <th>Date Created</th>
                                    <th>Date Modified</th>
                                    <th>Order Date</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${SO_LIST}" var="SO">
                                    <tr>
                                        <c:if test="${fn:contains(SO.attentionFlag, 'Waiting for payment')}">
                                            <td style="color: red"><h3>${(SO.SONumber)}</h3></td>
                                        </c:if>
                                        <c:if test="${not fn:contains(SO.attentionFlag, 'Waiting for payment')}">
                                            <td>${(SO.SONumber)}</td>
                                        </c:if>
                                        <td>${(SO.customer1.firstName)}, ${SO.customer1.lastName}</td>
                                        <td>${(SO.customer1.email)}</td>
                                        <td>${(SO.status)}</td>
                                        <td>${(SO.location)}</td>
                                        <td>${(SO.purchaseOrderNumber)}</td>
                                        <td>${(SO.dateCreated)}</td>
                                        <td>${(SO.dateModified)}</td>
                                        <td>${(SO.orderDate)}</td>
                                        <td>
                                            <a href="basket/${SO.customer1.customerId}/${SO.SOId}"><i class="fa fa-level-up fa-fw"></i>  Details</a>
                                        </td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>



                    </div>
                    <a href="${contextPath}/cabinet/cabinet" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
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
