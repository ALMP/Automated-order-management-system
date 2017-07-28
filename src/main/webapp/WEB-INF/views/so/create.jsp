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
                        <h5><i class="fa fa-plus-square fa-fw"></i> <b> Create a new So </b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/so/new" method="POST">
                                    <!--div class="form-group">
                                        <label for="SOId">SOId</label>
                                        <input class="form-control" type="number" name="SOId" path="SOId"  required="required" autofocus="autofocus"  />
                                    </div-->
                                    <div class="form-group">
                                        <p>Выберите дату: <input type="date" name="calenhdfr">
                                        <label for="dateCreated">Date Created</label>
                                        <input class="form-control" type="date" name="dateCreated" path="dateCreated"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="orderDate">Order Date</label>
                                        <input class="form-control" type="date" name="orderDate" path="orderDate"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Status<span style="color:red">*</span></label>
                                        <input class="form-control" type="text" name="status" path="status" required />
                                    </div>
                                    <div class="form-group">
                                        <label for="SONumber">SONumber<span style="color:red">*</span></label>
                                        <input class="form-control" type="text" name="SONumber" path="SONumber" required />
                                    </div>
                                    <div class="form-group">
                                        <label>Costumer</label>
                                        <select path="socustomer" name="socustomer" onchange=" ">
                                            <c:forEach items="${CUSTOMER_LIST}" var="CUSTOMER">
                                                <option value="${CUSTOMER.customerId}">${CUSTOMER.firstName}, ${CUSTOMER.lastName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Submit</button>
                                    <a href="${contextPath}/admin/so/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
