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
                        <h5><i class="fa fa-plus-square fa-fw"></i> <b> Create a new Statisticscollector </b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/statisticscollector/new" method="POST">
                                    <div class="form-group">
                                        <label for="SCId">SCId</label>
                                        <input class="form-control" type="number" name="SCId" path="SCId"  required="required" autofocus="autofocus"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="statisticType">Statistic Type</label>
                                        <input class="form-control" type="text" name="statisticType" path="statisticType"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="statisticsInfo">Statistics Info</label>
                                        <input class="form-control" type="text" name="statisticsInfo" path="statisticsInfo"  />
                                    </div>
                                    <div class="form-group">
                                        <label>Customer</label>
                                        <select path="customer1" name="customer1" onchange=" ">
                                            <option value="ord_null">Нет</option>
                                            <c:forEach items="${CUSTOMER_LIST}" var="CUSTOMER">
                                                <option value="${CUSTOMER.customerId}">${CUSTOMER.lastName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Submit</button>
                                    <a href="${contextPath}/admin/statisticscollector/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
