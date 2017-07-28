<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webresources/common/header.jspf"%>

<div id="wrapper">
    <%@ include file="/webresources/common/navigationbar.jspf"%>
    <div id="center-panel-grid">
        <div class="center-block">
            <div class="center-block">
                <div class="panel panel-default">

                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!--div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="CUSTOMER_TABLE">
                                <thead>
                                    <tr>
                                        <th>Customer Id</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Contact</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${CUSTOMER_LIST}" var="CUSTOMER">
                                    <tr>
                                        <td>${(CUSTOMER.customerId)}</td>

                                        <td>${(CUSTOMER.firstName)}</td>

                                        <td>${(CUSTOMER.lastName)}</td>

                                        <td>${(CUSTOMER.contact)}</td>

                                        <td>${(CUSTOMER.email)}</td>

                                        <td>${(CUSTOMER.phone)}</td>

                                        <td>${(CUSTOMER.address1.addressLine)}</td>

                                        <td><a href="${contextPath}/cabinet/update/${CUSTOMER.customerId}"><i class="fa fa-edit fa-fw"></i>  Edit</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

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
                        </div-->

                        <!--p>
                        <c:if test="${empty requestScope.CUSTOMER_LIST}">
                            <div class="alert alert-info">
                                <div align="center">No Customer found</div>
                            </div>
                        </c:if>
                        <p-->

                        <p><a class="btn btn-primary btn-sm center-block" href="${contextPath}/application/orderinfo"><i class=""></i>  Orders</a></p>
                        <p><a class="btn btn-primary btn-sm center-block" href="${contextPath}/cabinet/customerinfo"><i class=""></i>  Customers</a></p>
                        <p><a class="btn btn-primary btn-sm center-block" href="${contextPath}/cabinet/payments"><i class=""></i>  Payments</a></p>
                        <p><a class="btn btn-primary btn-sm center-block" href="${contextPath}/cabinet/password"><i class=""></i>  Change password</a></p>
                        <Br/>
                        <Br/>


                        <p><a href="${contextPath}/welcome" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a></p>

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
        $('#CUSTOMER_TABLE').DataTable({
            responsive: true
        });
    });
</script>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
