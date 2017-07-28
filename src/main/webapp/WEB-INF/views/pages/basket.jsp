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
                        <h5><i class="fa fa-plus-square fa-fw"></i> <b> Basket </b></h5>
                    </div>
                    <div class="panel-body">

                        <div class="container">
                            <ul class="nav nav-pills">
                                <c:if test="${STATUS != 'Canceled'}">
                                    <li class="active"><a href="${contextPath}/application/basket/${CUSTOMERID}/${SOID}">Card<span id="total-cart-count" class="badge"></span></a></li>
                                    <li><a href="${contextPath}/application/catalog/${CUSTOMERID}/${SOID}">Catalog</a></li>
                                    <li><a href="${contextPath}/application/order/${CUSTOMERID}/${SOID}">Checkout</a></li>
                                </c:if>
                            </ul>
                        </div>
                        <br />
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="PRODUCTITEMS_TABLE">
                                <thead>
                                <tr>
                                    <th>Item name</th>
                                    <th>One-time price</th>
                                    <th>Recurrent price</th>
                                    <c:if test="${STATUS == 'Wait'}">
                                        <th>Удаление</th>
                                    </c:if>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${PRODUCTITEMS_LIST}" var="PRODUCTITEMS">
                                    <tr>
                                        <td><a href="${contextPath}/application/itembasket/${PRODUCTITEMS.ordItem.orditemId}/${CUSTOMERID}/${SOID}">${(PRODUCTITEMS.ordItem.name)}</a></td>

                                        <td>${(PRODUCTITEMS.otp)}</td>

                                        <td>${(PRODUCTITEMS.mp)}</td>

                                        <c:if test="${STATUS == 'Wait'}">
                                            <c:if test="${PRODUCTITEMS.ordItem.status == 'Wait'}">
                                                <td><a href="${contextPath}/application/remove/${PRODUCTITEMS.ordItem.orditemId}/${CUSTOMERID}/${SOID}">Delete</a></td>
                                            </c:if>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <c:if test="${STATUS != 'Canceled'}">
                            <div>Result:
                                <label>One-time price: <span id="total-cart-summa">${(OTP.toString())}</span> BYN</label><br>
                                <label>Recurrent price: <span>${(CMP.toString())}</span>  BYN</label><br>
                                <label>Final One-time price with taxes and discounts: <span id="total-cart-summa">${(FOTP.toString())}</span> BYN</label><br>
                                <label>Final Recurrent price with taxes and discounts: <span>${(FCMP.toString())}</span>  BYN</label>
                            </div>
                        </c:if>
                        <%--<c:if test="${STATUS == 'Canceled'}">--%>
                        <%--<div>Result:--%>
                        <%--<label>One-time price: <span id="total-cart-summa">${(Pr.toString())}</span> BYN</label><br>--%>
                        <%--<label>Recurrent price: <span>${(CMP.toString())}</span>  BYN</label><br>--%>
                        <%--<label>Final One-time price with taxes and discounts: <span id="total-cart-summa">${(FOTP.toString())}</span> BYN</label><br>--%>
                        <%--<label>Final Recurrent price with taxes and discounts: <span>${(FCMP.toString())}</span>  BYN</label>--%>
                        <%--</div>--%>
                        <%--</c:if>--%>
                        <br />
                        <c:if test="${STATUS == 'Wait' and STATUS != 'Canceled'}">
                            <a class="btn btn-info" href="${contextPath}/application/order/${CUSTOMERID}/${SOID}">Checkout</a>
                        </c:if>
                        <c:if test="${CMP != 0 and FCMP !=0 and STATUS == 'Ordered' and STATUS != 'Canceled'}">
                            <a class="btn btn-info" href="${contextPath}/application/cancel/${CUSTOMERID}/${SOID}/">Cancel order</a>
                        </c:if>
                        <a href="${contextPath}/application/orderinfo" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                        <!--a href="${contextPath}/application/print" class="btn btn-default btn-sm" onclick="javascript:window.print()">
                            <i class="fa fa-print fa-fw"></i> Print
                        </a-->
                        <a href="${contextPath}/application/print/${CUSTOMERID}/${SOID}" class="btn btn-default btn-sm">
                            <i class="fa fa-print fa-fw"></i> Print
                        </a>
                    </div>
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
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
