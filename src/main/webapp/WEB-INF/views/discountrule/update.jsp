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
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Update Discountrule</b></h5> 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/discountrule/update" method="POST">
                                    <div class="form-group">
                                        <label for="dRId">DRId</label>
                                        <input class="form-control" type="number" name="dRId" readonly value="${DISCOUNTRULE.dRId}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="discountValue">Discount Value</label>
                                        <input class="form-control" type="number" name="discountValue"  value="${DISCOUNTRULE.discountValue}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="discountProcent">Discount Procent</label>
                                        <input class="form-control" type="number" min="0" max="100" step="0.01" name="discountProcent"  value="${DISCOUNTRULE.discountProcent}" />
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <input class="form-control" type="text" name="description"  value="${DISCOUNTRULE.description}" />
                                    </div>
                                    <div class="form-group">
                                        <label>Tax/Discount</label>
                                        <select path="type" name="type" onchange=" ">
                                            <option value="tax">Tax</option>
                                            <option value="disc">Discount</option>
                                        </select>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                    <a href="${contextPath}/admin/discountrule/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
