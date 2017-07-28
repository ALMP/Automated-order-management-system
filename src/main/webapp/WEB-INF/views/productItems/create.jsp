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
                        <h5><i class="fa fa-plus-square fa-fw"></i> <b> Create a new Product Items </b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/productitems/new" method="POST">

                                    <div class="form-group">
                                        <label>Item</label>
                                        <select path="Item" name="Item" onchange=" ">
                                            <option value="ord_null">Нет</option>
                                            <c:forEach items="${ITEM_LIST}" var="ITEM">
                                                <option value="${ITEM.itemId}">${ITEM.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>SOProduct</label>
                                        <select path="Soproduct" name="Soproduct" onchange=" ">
                                            <option value="ord_null">Нет</option>
                                            <c:forEach items="${SOPRODUCT_LIST}" var="SOPRODUCT">
                                                <option value="${SOPRODUCT.SOPId}">${SOPRODUCT.mp}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Submit</button>
                                    <a href="${contextPath}/productitems/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
