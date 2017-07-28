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
                            <div class="col-lg-6"><h5><i class="fa fa-database fa-fw"></i> <b> User payments</b></h5></div>
                            <div class="col-lg-6">
                                <div align="right">
                                    <c:if test="${not empty requestScope.PAYMENT_LIST}">
                                        <button class="btn btn-default btn-sm" onclick="javascript:window.print()">
                                            <i class="fa fa-print fa-fw"></i> Print Payment list
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="PAYMENT_TABLE">
                                <thead>
                                <tr>
                                    <th>Payment number</th>
                                    <th>Order number</th>
                                    <th>Payment date</th>
                                    <th>Info</th>
                                    <th>One-time price</th>
                                    <th>Mounth price</th>
                                    <th>Payment type</th>
                                    <th>Print</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${PAYMENTS_LIST}" var="PAYMENT">
                                    <tr>
                                        <td>${PAYMENT.paymentId}</td>

                                        <td>${PAYMENT.so1.SONumber}</td>

                                        <td>${PAYMENT.paymentDate}</td>

                                        <td>${PAYMENT.paymentInfo}</td>

                                        <td>${PAYMENT.paymentbill1.cotp}</td>

                                        <td>${PAYMENT.paymentbill1.cmp}</td>

                                        <td>${PAYMENT.paymenttype1.typeName}</td>

                                        <td><a href="${contextPath}/cabinet/print/${PAYMENT.paymentId}">
                                            <i class="fa fa-print fa-fw"></i> Print
                                        </a></td>


                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>



                        <a href="${contextPath}/cabinet/cabinet" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#PAYMENT_TABLE').DataTable({
            responsive: true
        });
    });
</script>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
