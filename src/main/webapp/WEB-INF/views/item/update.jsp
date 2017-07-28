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
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Update Item</b></h5> 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/item/update" method="POST">
                                    <div class="form-group">
                                        <label for="itemId">Item Id</label>
                                        <input class="form-control" type="number" name="itemId" readonly value="${ITEM.itemId}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z0-9- ]+" title="Only numbers and english letters" name="name"  value="${ITEM.name}" required = "required" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="type">Type</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z0-9- ]+" title="Only numbers and english letters" name="type"  value="${ITEM.type}" required = "required" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z0-9- ]+" title="Only numbers and english letters" name="description"  value="${ITEM.description}" required = "required" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="defMP">Def MP</label>
                                        <input class="form-control" type="number" min="0" step="1" name="defMP"  value="${ITEM.defMP}" required = "required" />
                                    </div>
                                    <div class="form-group">
                                        <label for="defOTP">Def OTP</label>
                                        <input class="form-control" type="number" min="0" max="100" step="0.01" name="defOTP"  value="${ITEM.defOTP}" required = "required" />
                                    </div>
                                    <div class="form-group">
                                        <label for="quantity">Amount</label>
                                        <input class="form-control" type="number" min="0" step="1" name="quantity"  value="${ITEM.quantity}" required = "required" />
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                    <a href="${contextPath}/admin/item/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
