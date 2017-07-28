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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Characteristics</b></h5>
                    </div>
                    <div class="panel-body">

                        <h4>To add the feature</h4>
                        <table class="table table-striped table-bordered table-hover" id="CHARACTERISTICS_TABLE">
                            <thead>
                            <tr>
                                <th>Characteristics Id</th>
                                <th>Characteristic</th>
                                <th>Characteristic Value</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${CHARACTERISTICS_LIST}" var="C">
                                <tr>
                                    <td>${C.characteristicId}</td>
                                    <td>${C.characteristicId}</td>
                                    <td>${C.characteristicValue}</td>
                                    <td><a href="${contextPath}/admin/item/removecharacteristicses/${ITEM.itemId}/${C.characteristicId}">Remove</a></td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <h4>To remove the feature</h4>
                        <table class="table table-striped table-bordered table-hover" id="CHARACTERISTICS_TABLE_1">
                            <thead>
                            <tr>
                                <th>Characteristics Id</th>
                                <th>Characteristic</th>
                                <th>Characteristic Value</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${NCHARACTERISTICS_LIST}" var="C">
                                <tr>
                                    <td>${C.characteristicId}</td>
                                    <td>${C.characteristicId}</td>
                                    <td>${C.characteristicValue}</td>
                                    <td><a href="${contextPath}/admin/item/addcharacteristicses/${ITEM.itemId}/${C.characteristicId}">Add</a></td>

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
        $('#CHARACTERISTICS_TABLE').DataTable({
            responsive: true
        });
        $('#CHARACTERISTICS_TABLE_1').DataTable({
            responsive: true
        });
    });
</script>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
