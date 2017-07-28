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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> So info</b></h5>
                    </div>
                    <div class="panel-body">

                        <h4>Discount/Tax</h4>
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Type</th>
                                <th>Value</th>
                                <th>Procent</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${DISC}" var="D">
                                <tr>
                                    <td>${D.discountrule1.dRId}</td>
                                    <td>${D.discountrule1.type}</td>
                                    <td>${D.discountrule1.discountValue}</td>
                                    <td>${D.discountrule1.discountProcent}</td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <h4>Characteristics</h4>
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE_1">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Characteristic</th>
                                <th>Characteristic Value</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${CHAR}" var="C">
                                <tr>
                                    <td>${C.itemCharacteristic.characteristicId}</td>
                                    <td>${C.itemCharacteristic.characteristic}</td>
                                    <td>${C.itemCharacteristic.characteristicValue}</td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Item Id :</span></div>
                                            <div class="col-lg-8">${(ITEM.orditemId)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Name :</span></div>
                                            <div class="col-lg-8">${(ITEM.name)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Type :</span></div>
                                            <div class="col-lg-8">${(ITEM.type)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Description :</span></div>
                                            <div class="col-lg-8">${(ITEM.description)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>DefMP :</span></div>
                                            <div class="col-lg-8">${(ITEM.defMP)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>DefOTP :</span></div>
                                            <div class="col-lg-8">${(ITEM.defOTP)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Modified Date :</span></div>
                                            <div class="col-lg-8">${(ITEM.modifiedDate)}</div>
                                        </div>
                                    </a>

                                </div>
                                <a href="${contextPath}/admin/so/${SO}" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
</div>
<script>
    $(document).ready(function () {
        $('#ITEM_TABLE').DataTable({
            responsive: true
        });
        $('#ITEM_TABLE_1').DataTable({
            responsive: true
        });
    });
</script>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
