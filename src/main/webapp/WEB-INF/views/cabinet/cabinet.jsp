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
                            <div class="col-lg-6"><h5><i class="fa fa-database fa-fw"></i> <b> Customer List</b></h5></div>
                            <div class="col-lg-6">
                                <div align="right">
                                    <a class="btn btn-primary btn-sm" href="newcustomer"><i class="fa fa-plus"></i> Add</a>
                                    <c:if test="${not empty requestScope.CUSTOMER_LIST}">
                                        <button class="btn btn-default btn-sm" onclick="javascript:window.print()">
                                            <i class="fa fa-print fa-fw"></i> Print Customer list
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover" id="CUSTOMER_TABLE">
                                <thead>
                                <tr>
                                    <th>Customer Id</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Contact</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>User</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${CUSTOMER_LIST}" var="CUSTOMER">
                                    <tr>
                                        <td>${(CUSTOMER.customerId)}</td>

                                        <td>${(CUSTOMER.firstName)}</td>

                                        <td>${(CUSTOMER.lastName)}</td>

                                        <td>${(CUSTOMER.contact)}</td>

                                        <td>${(CUSTOMER.email)}</td>

                                        <td>${(CUSTOMER.phone)}</td>

                                        <td><div data-html="true" data-toggle="tooltip"
                                                 title="
                                            Country: ${CUSTOMER.address1.country} <br>
                                            City: ${CUSTOMER.address1.city} <br>
                                            Postal code: ${CUSTOMER.address1.postalCode} <br>
                                            Address: ${CUSTOMER.address1.addressLine}">${(CUSTOMER.address1.addressLine)}</div>
                                        </td>

                                        <td>${(CUSTOMER.username)}</td>

                                        <td>
                                            <div class="pull-right">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown">
                                                        <i class="fa fa-gear"></i>  <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right" role="menu">
                                                        <li><a href="${contextPath}/cabinet/customer/update/${CUSTOMER.customerId}"><i class="fa fa-edit fa-fw"></i>  Edit</a></li>
                                                        <li class="divider"></li>
                                                        <li><a data-toggle="modal" data-target="#confirm_delete_${CUSTOMER.customerId}" href="#"  ><i class="fa fa-trash-o fa-fw"></i> Delete</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- Modal -->
                                            <div class="modal fade" id="confirm_delete_${CUSTOMER.customerId}" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title">Confirmation</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Are you sure to delete Customer ?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <form action="${contextPath}/cabinet/customer/remove/${CUSTOMER.customerId}" method="DELETE">
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


                        <a href="${contextPath}/cabinet/cabinet" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                    </div>
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
        $('#CUSTOMER_TABLE').DataTable({
            responsive: true
        });
    });
</script>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
