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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Location</b></h5>
                    </div>
                    <div class="panel-body">

                        <h4>Add the location of the sale</h4>
                        <table class="table table-striped table-bordered table-hover" id="DISCOUNTRULE_TABLE">
                            <thead>
                            <tr>
                                <th>Location Id</th>
                                <th>Country</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${LOCATIONS_LIST}" var="L">
                                <tr>
                                    <td>${L.locationId}</td>
                                    <td>${L.locationname}</td>
                                    <td><a href="${contextPath}/admin/item/removelocations/${ITEM.itemId}/${L.locationId}">Remove</a></td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <h4>To remove the location of the sale</h4>
                        <table class="table table-striped table-bordered table-hover" id="DISCOUNTRULE_TABLE_1">
                            <thead>
                            <tr>
                                <th>Location Id</th>
                                <th>Country</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${NLOCATIONS_LIST}" var="L">
                                <tr>
                                    <td>${L.locationId}</td>
                                    <td>${L.locationname}</td>
                                    <td><a href="${contextPath}/admin/item/addlocations/${ITEM.itemId}/${L.locationId}">Add</a></td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <a href="${contextPath}/admin/item/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#DISCOUNTRULE_TABLE').DataTable({
            responsive: true
        });
        $('#DISCOUNTRULE_TABLE_1').DataTable({
            responsive: true
        });
    });
</script>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
