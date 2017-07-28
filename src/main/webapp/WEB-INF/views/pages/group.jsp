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
                            <div class="col-lg-6"><h5><i class="fa fa-database fa-fw"></i> <b> Group 1 List</b></h5></div>
                            <div class="col-lg-6">
                                <div align="right">
                                    <a class="btn btn-primary btn-sm" href="new"><i class="fa fa-plus"></i> Add</a>
                                    <c:if test="${not empty requestScope.GROUP_LIST}">
                                        <button class="btn btn-default btn-sm" onclick="javascript:window.print()">
                                            <i class="fa fa-print fa-fw"></i> Print Group 1 list
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="GROUP_1_TABLE">
                                <thead>
                                <tr>
                                    <th>Item Id</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Description</th>
                                    <th>Discount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ITEMGROUP_LIST}" var="ITEMGROUP">
                                    <c:if test="${ITEMGROUP.groups1.groupId == ID}">

                                        <tr>

                                            <td>${(ITEMGROUP.item1.itemId)}</td>

                                            <td>${(ITEMGROUP.item1.name)}</td>

                                            <td>${(ITEMGROUP.item1.type)}</td>

                                            <td>${(ITEMGROUP.item1.description)}</td>

                                            <td>
                                                <select>
                                                    <c:forEach items="${ITEMDISCOUNT_LIST}" var="ITEMDISCOUNT">
                                                        <c:if test="${ITEMDISCOUNT.item1.itemId == ITEMGROUP.item1.itemId}">
                                                            <option>
                                                                    ${(ITEMDISCOUNT.discountrule1.discountValue)}ք
                                                                    ${(ITEMDISCOUNT.discountrule1.discountProcent)}%
                                                            </option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>

                                            </td>

                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>

                            <table class="table table-striped table-bordered table-hover" id="GROUP_1_TABLE">
                                <thead>
                                <tr>
                                    <th>Productitems Id</th>
                                    <th>SO Number</th>
                                    <th>Item</th>
                                    <th>Customer</th>
                                    <th>Payment Info</th>
                                    <th>Payment Bill</th>
                                    <th>Payment Type</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${PRODUCTITEMS_LIST}" var="PRODUCTITEMS">
                                    <c:forEach items="${ITEMGROUP_LIST}" var="ITEMGROUP">
                                        <c:if test="${ITEMGROUP.groups1.groupId == ID}">
                                            <c:if test="${ITEMGROUP.item1.itemId == PRODUCTITEMS.item1.itemId}">

                                                <tr>

                                                    <td>${(PRODUCTITEMS.id)}</td>
                                                    <td>${(PRODUCTITEMS.soproduct1.so1.SONumber)}</td>
                                                    <td>${(ITEMGROUP.item1.name)}</td>
                                                    <td>${(PRODUCTITEMS.soproduct1.so1.customer1.firstName)}</td>


                                                    <td>
                                                        <select>
                                                            <c:forEach items="${PAYMENT_LIST}" var="PAYMENT">
                                                                <c:if test="${PAYMENT.so1.SOId == PRODUCTITEMS.soproduct1.so1.SOId}">
                                                                    <option>
                                                                            ${(PAYMENT.paymentInfo)}
                                                                    </option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select>
                                                            <c:forEach items="${PAYMENT_LIST}" var="PAYMENT">
                                                                <c:if test="${PAYMENT.so1.SOId == PRODUCTITEMS.soproduct1.so1.SOId}">
                                                                    <option>
                                                                            ${(PAYMENT.paymentbill1.cmp)}
                                                                    </option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select>
                                                            <c:forEach items="${PAYMENT_LIST}" var="PAYMENT">
                                                                <c:if test="${PAYMENT.so1.SOId == PRODUCTITEMS.soproduct1.so1.SOId}">
                                                                    <option>
                                                                            ${(PAYMENT.paymenttype1.typeName)}
                                                                    </option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>

                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>


                        <c:if test="${empty requestScope.GROUP_LIST}">
                            <div class="alert alert-info">
                                <div align="center">No Groups found</div>
                            </div>
                        </c:if>



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
        $('#GROUP_TABLE').DataTable({
            responsive: true
        });
    });
</script>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
