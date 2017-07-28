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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Customer info</b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Customer Id :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.customerId}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>First Name :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.firstName}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Last Name :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.firstName}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Contact :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.contact}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Email :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.email}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Phone :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.phone}</div>
                                        </div>
                                    </a>

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Address Line :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.address1.addressLine}</div>
                                        </div>
                                    </a>

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>City :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.address1.city}</div>
                                        </div>
                                    </a>

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Country :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.address1.country}</div>
                                        </div>
                                    </a>

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Date :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.address1.modifiedDate}</div>
                                        </div>
                                    </a>

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Code :</span></div>
                                            <div class="col-lg-8">${CUSTOMER.address1.postalCode}</div>
                                        </div>
                                    </a>

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>User :</span></div>
                                            <div class="col-lg-8">${USER.username}</div>
                                        </div>
                                    </a>
                                </div>
                                <a href="${contextPath}/admin/customer/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
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

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
