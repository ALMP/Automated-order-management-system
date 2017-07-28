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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> So Info</b></h5>
                    </div>
                    <div class="panel-body">
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
                                <c:forEach items="${PROD}" var="P">
                                    <tr>
                                        <td>${P.ordItem.orditemId}</td>
                                        <td>${P.ordItem.name}</td>
                                        <td>${P.ordItem.type}</td>
                                        <td>${P.ordItem.description}</td>
                                        <td>${P.ordItem.defMP}</td>
                                        <td>${P.ordItem.defOTP}</td>
                                        <td>${P.ordItem.modifiedDate}</td>
                                        <td><a href="${contextPath}/admin/so/item/${P.ordItem.orditemId}/${P.soproduct1.so1.SOId}"><i class="fa fa-level-up fa-fw"></i>  More</a></td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>SOId :</span></div>
                                            <div class="col-lg-8">${(SO.SOId)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>So number :</span></div>
                                            <div class="col-lg-8">${(SO.SONumber)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Purchase Order Number :</span></div>
                                            <div class="col-lg-8">${(SO.purchaseOrderNumber)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Location :</span></div>
                                            <div class="col-lg-8">${(SO.location)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Date Created :</span></div>
                                            <div class="col-lg-8">${(SO.dateCreated)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Date Modified :</span></div>
                                            <div class="col-lg-8">${(SO.dateModified)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Order Date :</span></div>
                                            <div class="col-lg-8">${(SO.orderDate)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>FinalMP :</span></div>
                                            <div class="col-lg-8">${(SO.finalMP)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>FinalMPwithTaxAndDiscount :</span></div>
                                            <div class="col-lg-8">${(SO.finalMPwithTaxAndDiscount)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>FinalOTP :</span></div>
                                            <div class="col-lg-8">${(SO.finalOTP)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>FinalOTPwithTaxAndDiscount :</span></div>
                                            <div class="col-lg-8">${(SO.finalOTPwithTaxAndDiscount)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>User :</span></div>
                                            <div class="col-lg-8">${USER.username}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Customer :</span></div>
                                            <div class="col-lg-8">${(SO.customer1.lastName)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Email :</span></div>
                                            <div class="col-lg-8">${(SO.customer1.email)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Pass Number :</span></div>
                                            <div class="col-lg-8">${(SO.customer1.passNumber)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Count Number :</span></div>
                                            <div class="col-lg-8">${(SO.customer1.countNumber)}</div>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span>Phone :</span></div>
                                            <div class="col-lg-8">${(SO.customer1.phone)}</div>
                                        </div>
                                    </a>

                                </div>
                                <a href="${contextPath}/admin/so/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
                                <c:if test="${SO.status != 'Canceled' and SO.status != 'Open'}">
                                    <a href="${contextPath}/admin/so/pay/${SO.SOId}" class="btn btn-default">Fake pay <i class="fa fa-arrow-circle-right fa-fw"></i></a>
                                </c:if>
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
