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
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="PRODUCTITEMS_TABLE">
                                <tbody>
                                <tr>
                                    <td><b>Item name</b></td>
                                    <td><b>One-time price</b></td>
                                    <td><b>Recurrent price</b></td>
                                </tr>
                                </tbody>
                                <tbody>
                                <c:forEach items="${PRODUCTITEMS_LIST}" var="PRODUCTITEMS">
                                    <tr>
                                        <td>${(PRODUCTITEMS.ordItem.name)}</td>

                                        <td>${(PRODUCTITEMS.otp)}</td>


                                        <td>${(PRODUCTITEMS.mp)}</td>
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
                        <button class="btn btn-default btn-sm noprint" onclick="javascript:window.print()">
                            <i class="fa fa-print fa-fw"></i> Print SO Info
                        </button>
                        <a href="${contextPath}/application/basket/${CUSTOMERID}/${SOID}" class="btn btn-default noprint"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
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
<style media='print' type='text/css'>
    #navbar-iframe {display: none; height: 0px; visibility: hidden;}
    .noprint {display: none;}
    body {background:#FFF; color:#000;}
    a {text-decoration: underline; color:#00F;}
</style>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
