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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Discountrule info</b></h5> 
                    </div>
                    <div class="panel-body">

                        <h4>To remove the feature</h4>
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE">
                            <thead>
                            <tr>
                                <th>Item Id</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Def MP</th>
                                <th>Def OTP</th>
                                <th>Modified Date</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ITEM_LIST}" var="ITEM">
                                <tr>
                                    <td>${ITEM.itemId}</td>

                                    <td>${ITEM.name}</td>

                                    <td>${ITEM.type}</td>

                                    <td>${ITEM.description}</td>

                                    <td>${ITEM.defMP}</td>

                                    <td>${ITEM.defOTP}</td>

                                    <td>${ITEM.modifiedDate}</td>

                                    <td><a href="${contextPath}/admin/discountrule/removeitem/${ITEM.itemId}/${DISCOUNTRULE.dRId}">Delete</a></td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <h4>To remove the feature</h4>
                        <table class="table table-striped table-bordered table-hover" id="ITEM_TABLE_1">
                            <thead>
                            <tr>
                                <th>Item Id</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Def MP</th>
                                <th>Def OTP</th>
                                <th>Modified Date</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${NITEM_LIST}" var="ITEM">
                                <tr>
                                    <td>${ITEM.itemId}</td>

                                    <td>${ITEM.name}</td>

                                    <td>${ITEM.type}</td>

                                    <td>${ITEM.description}</td>

                                    <td>${ITEM.defMP}</td>

                                    <td>${ITEM.defOTP}</td>

                                    <td>${ITEM.modifiedDate}</td>

                                    <td><a href="${contextPath}/admin/discountrule/add/${ITEM.itemId}/${DISCOUNTRULE.dRId}">Add</a></td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>



                        <!--div class="row">
                            <div class="col-lg-12">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span class="small">DRId :</span></div>
                                            <div class="col-lg-8">${(DISCOUNTRULE.dRId)}</div>
                                        </div>
                                    </a>             
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span class="small">Discount Value :</span></div>
                                            <div class="col-lg-8">${(DISCOUNTRULE.discountValue)}</div>
                                        </div>
                                    </a>             
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span class="small">Discount Procent :</span></div>
                                            <div class="col-lg-8">${(DISCOUNTRULE.discountProcent)}</div>
                                        </div>
                                    </a>             

                                </div>
                                <a href="${contextPath}/admin/discountrule/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                            </div>
                        </div-->
                        <a href="${contextPath}/admin/discountrule/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
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
