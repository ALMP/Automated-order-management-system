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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Item info</b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="list-group">
                                    <form role="form" action="${contextPath}/application/add/${ITEMID}/${CUSTOMERID}/${SOID}" method="GET">
                                        <a href="#" class="list-group-item">
                                            <div class="row">
                                                <div class="col-lg-4"><span class="small">Name :</span></div>
                                                <div class="col-lg-8">${(ITEM.name)}</div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row">
                                                <div class="col-lg-4"><span class="small">Type :</span></div>
                                                <div class="col-lg-8">${(ITEM.type)}</div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row">
                                                <div class="col-lg-4"><span class="small">Description :</span></div>
                                                <div class="col-lg-8">${(ITEM.description)}</div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row">
                                                <div class="col-lg-4"><span class="small">Def MP :</span></div>
                                                <div class="col-lg-8">${(ITEM.defMP)}</div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row">
                                                <div class="col-lg-4"><span class="small">Def OTP :</span></div>
                                                <div class="col-lg-8">${(ITEM.defOTP)}</div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row">
                                                <div class="col-lg-4"><span class="small">Modified Date :</span></div>
                                                <div class="col-lg-8">${(ITEM.modifiedDate)}</div>
                                            </div>
                                        </a>
                                        <label>Charactiristics: </label><br>
                                        <div class="list-group">
                                            <c:forEach items="${ITEMCHARACTERISTICS}" var="Characteristic">
                                            <tr>
                                                <c:if test="${Characteristic.item.itemId==ITEM.itemId}">
                                                    <td><label><input type="checkbox" name="characteristics" value="${Characteristic.itemCharacteristic.characteristicId}">${Characteristic.itemCharacteristic.characteristic}:  ${Characteristic.itemCharacteristic.characteristicValue}</label></td>
                                                </c:if>
                                            </tr>
                                            </c:forEach>
                                        </div>
                                        <c:if test="${not empty ITEMDISCOUNTS}">
                                            <% if (request.isUserInRole("ROLE_ADMIN")) {%>
                                            <label>Discounts: </label><br>
                                            <div class="list-group">
                                                <c:forEach items="${ITEMDISCOUNTS}" var="DISCOUNT">
                                                    <tr>
                                                        <c:if test="${(DISCOUNT.item1.itemId==ITEM.itemId && DISCOUNT.discountrule1.type=='disc') or DISCOUNT.item1.itemId==ITEM.itemId && DISCOUNT.discountrule1.type=='discount'}">
                                                            <td><label><input type="checkbox" name="discounts" value="${DISCOUNT.discountrule1.dRId}">${DISCOUNT.discountrule1.description}:
                                                                    ${DISCOUNT.discountrule1.discountValue}</label></td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                            </div>
                                            <%}%>
                                            <label>Taxes: </label><br>
                                            <div class="list-group">
                                            <c:forEach items="${ITEMDISCOUNTS}" var="DISCOUNT">
                                                <tr>
                                                    <c:if test="${DISCOUNT.item1.itemId==ITEM.itemId && DISCOUNT.discountrule1.type=='tax'}">
                                                        <td><label>${DISCOUNT.discountrule1.description} : ${DISCOUNT.discountrule1.discountProcent}</label> - Percentage</td>
                                                        <td><label>${DISCOUNT.discountrule1.description} : ${DISCOUNT.discountrule1.discountValue}</label> - Value</td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                            </div>
                                        </c:if>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Submit</button>
                                        <a href="${contextPath}/application/catalog/${CUSTOMERID}/${SOID}" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                                    </form>
                                </div>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                        </div>
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

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
