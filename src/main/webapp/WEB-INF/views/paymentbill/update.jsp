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
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Update Paymentbill</b></h5> 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/paymentbill/update" method="POST">
                                    <div class="form-group">
                                        <label for="PBId">PBId</label>
                                        <input class="form-control" type="number" name="PBId" readonly value="${PAYMENTBILL.PBId}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="cmp">Cmp</label>
                                        <input class="form-control" type="number" name="cmp"  value="${PAYMENTBILL.cmp}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="cotp">Cotp</label>
                                        <input class="form-control" type="number" name="cotp"  value="${PAYMENTBILL.cotp}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="CMPDisc">CMPDisc</label>
                                        <input class="form-control" type="number" name="CMPDisc"  value="${PAYMENTBILL.CMPDisc}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="COTPDisc">COTPDisc</label>
                                        <input class="form-control" type="number" name="COTPDisc"  value="${PAYMENTBILL.COTPDisc}" />
                                    </div>     
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                    <a href="${contextPath}/admin/paymentbill/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
