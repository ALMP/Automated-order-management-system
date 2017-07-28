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
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Update Soproduct</b></h5> 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/soproduct/update" method="POST">
                                    <div class="form-group">
                                        <label for="SOPId">SOPId</label>
                                        <input class="form-control" type="number" name="SOPId" readonly value="${SOPRODUCT.SOPId}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="mp">Mp</label>
                                        <input class="form-control" type="number" name="mp"  value="${SOPRODUCT.mp}" />
                                    </div>     
                                    <div class="form-group">
                                        <label for="otp">Otp</label>
                                        <input class="form-control" type="number" name="otp"  value="${SOPRODUCT.otp}" />
                                    </div>     
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                    <a href="${contextPath}/admin/soproduct/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
