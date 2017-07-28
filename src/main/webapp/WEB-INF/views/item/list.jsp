<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webresources/common/header.jspf"%>

<div id="wrapper">
    <%@ include file="/webresources/common/navigationbar.jspf"%>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-lg-6"><h5><i class="fa fa-database fa-fw"></i> <b> Item List</b></h5></div>
                            <div class="col-lg-6">
                                <div align="right">
                                    <a class="btn btn-primary btn-sm" href="new"><i class="fa fa-plus"></i> Add</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
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
                                        <th>Amount</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${ITEM_LIST}" var="ITEM">
                                        <tr>
                                            <td>${(ITEM.itemId)}</td>

                                            <td>${(ITEM.name)}</td>

                                            <td>${(ITEM.type)}</td>

                                            <td>${(ITEM.description)}</td>

                                            <td>${(ITEM.defMP)}</td>

                                            <td>${(ITEM.defOTP)}</td>

                                            <td>${(ITEM.modifiedDate)}</td>

                                            <td>${(ITEM.quantity)}</td>

                                            <td>
                                                <div class="pull-right">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown">
                                                            <i class="fa fa-gear"></i>  <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu pull-right" role="menu">
                                                            <li><a href="${ITEM.itemId}"><i class="fa fa-level-up fa-fw"></i>  Groups</a></li>
                                                            <li><a href="${contextPath}/admin/item/discountrule/${ITEM.itemId}"><i class="fa fa-level-up fa-fw"></i>  Discount</a></li>
                                                            <li><a href="${contextPath}/admin/item/locations/${ITEM.itemId}"><i class="fa fa-level-up fa-fw"></i>  Locations</a></li>
                                                            <li><a href="${contextPath}/admin/item/characteristicses/${ITEM.itemId}"><i class="fa fa-level-up fa-fw"></i>  Characteristics</a></li>
                                                            <li><a href="${contextPath}/admin/item/update/${ITEM.itemId}"><i class="fa fa-edit fa-fw"></i>  Edit</a></li>
                                                            <li class="divider"></li>
                                                            <li><a data-toggle="modal" data-target="#confirm_delete_${ITEM.itemId}" href="#"  ><i class="fa fa-trash-o fa-fw"></i> Delete</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- Modal -->
                                                <div class="modal fade" id="confirm_delete_${ITEM.itemId}" tabindex="-1" role="dialog" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                <h4 class="modal-title">Confirmation</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Are you sure to delete Item ?</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <form action="${contextPath}/admin/item/remove/${ITEM.itemId}" method="DELETE">
                                                                    <a href="#" class="btn" data-dismiss="modal">Cancel</a> <button type="submit" class="btn btn-primary">Confirm</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <!-- /.modal-content -->
                                                    </div>
                                                    <!-- /.modal-dialog -->
                                                </div>
                                                <!-- /.modal -->
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>


                        <c:if test="${empty requestScope.ITEM_LIST}">
                            <div class="alert alert-info">
                                <div align="center">No Item found</div>
                            </div>
                        </c:if>



                    </div>
                    <a href="${contextPath}/adm" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#ITEM_TABLE').DataTable({
            responsive: true
        });
    });
</script>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
