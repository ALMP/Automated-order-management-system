<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webresources/common/header.jspf"%>



<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div>
    <%@ include file="/webresources/common/navigationbar.jspf"%>
    <div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="list-group">
                                <table class="table table-striped table-bordered table-hover" id="PAYMENT_TABLE">
                                    <tbody>
                                        <tr>
                                            <td><div class="col-lg-4"><span>Payment Number :</span></div></td>
                                            <td><div class="col-lg-8">${PAY.paymentId}</div></td>
                                        </tr>
                                        <tr>
                                            <td><div class="col-lg-4"><span>Order Number :</span></div></td>
                                            <td><div class="col-lg-8">${PAY.so1.SONumber}</div></td>
                                        </tr>
                                        <tr>
                                            <td><div class="col-lg-4"><span>Payment Date :</span></div></td>
                                            <td><div class="col-lg-8">${PAY.paymentDate}</div></td>
                                        </tr>
                                        <tr>
                                            <td><div class="col-lg-4"><span>Info :</span></div></td>
                                            <td><div class="col-lg-8">${PAY.paymentInfo}</div></td>
                                        </tr>
                                        <tr>
                                            <td><div class="col-lg-4"><span>One-time price :</span></div></td>
                                            <td><div class="col-lg-8">${PAY.paymentbill1.cotp}</div></td>
                                        </tr>
                                        <tr>
                                            <td><div class="col-lg-4"><span>Mouth price :</span></div></td>
                                            <td><div class="col-lg-8">${PAY.paymentbill1.cmp}</div></td>
                                        </tr>
                                        <tr>
                                            <td><div class="col-lg-4"><span>Type :</span></div></td>
                                            <td><div class="col-lg-8">${PAY.paymenttype1.typeName}</div></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--div class="row">
                                    <div class="col-lg-4"><span>Payment Number :</span></div>
                                    <div class="col-lg-8">${PAY.paymentId}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4"><span>Order Number :</span></div>
                                    <div class="col-lg-8">${PAY.so1.SONumber}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4"><span>Payment Date :</span></div>
                                    <div class="col-lg-8">${PAY.paymentDate}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4"><span>Info :</span></div>
                                    <div class="col-lg-8">${PAY.paymentInfo}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4"><span>One-time price :</span></div>
                                    <div class="col-lg-8">${PAY.paymentbill1.cotp}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4"><span>Mouth price :</span></div>
                                    <div class="col-lg-8">${PAY.paymentbill1.cmp}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4"><span>Type :</span></div>
                                    <div class="col-lg-8">${PAY.paymenttype1.typeName}</div>
                                </div-->
                            </div>
                            <button class="btn btn-default btn-sm noprint" onclick="javascript:window.print()">
                                <i class="fa fa-print fa-fw"></i> Print Payment Info
                            </button>
                            <a href="${contextPath}/cabinet/payments" class="btn btn-default noprint"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                    </div>
                    <!-- /.row (nested) -->
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $('#PRODUCTITEMS_TABLE').dataTable();
    });
</script>
<style media='print' type='text/css'>
    #navbar-iframe {display: none; height: 0px; visibility: hidden;}
    .noprint {display: none;}
    body {background:#FFF; color:#000;}
    a {text-decoration: underline; color:#00F;}
</style>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
