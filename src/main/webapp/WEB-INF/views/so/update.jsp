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
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Update So</b></h5> 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/so/update" method="POST">
                                    <div class="form-group">
                                        <label for="SOId">SOId</label>
                                        <input class="form-control" type="number" name="SOId" readonly value="${SO.SOId}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="dateCreated">Date Created</label>
                                        <input class="form-control" type="date" name="dateCreated"  value="${SO.dateCreated}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="orderDate">Order Date</label>
                                        <input class="form-control" type="date" name="orderDate"  value="${SO.orderDate}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <input class="form-control" type="text" name="status"  value="${SO.status}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="SONumber">SONumber</label>
                                        <input class="form-control" type="text" name="SONumber"  value="${SO.SONumber}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="purchaseOrderNumber">Purchase Order Number</label>
                                        <input class="form-control" type="text" name="purchaseOrderNumber"  value="${SO.purchaseOrderNumber}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="dateModified">Date Modified</label>
                                        <input class="form-control" type="text" name="dateModified"  value="${SO.dateModified}" />
                                    </div>     
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
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
