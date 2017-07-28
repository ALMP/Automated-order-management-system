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
                        <h5><i class="fa fa-info-circle fa-fw"></i> <b> Group info</b></h5>
                    </div>
                    <div class="panel-body">

                        <h4>Add item</h4>
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
                            <c:forEach items="${ITEMGROUP_LIST}" var="ITEMGROUP">
                                <c:if test="${ITEMGROUP.groups1.groupId == GROUP.groupId}">
                                    <tr>
                                        <td>${ITEMGROUP.item1.itemId}</td>
                                        <td>${ITEMGROUP.item1.name}</td>
                                        <td>${ITEMGROUP.item1.type}</td>
                                        <td>${ITEMGROUP.item1.description}</td>
                                        <td>${ITEMGROUP.item1.defMP}</td>
                                        <td>${ITEMGROUP.item1.defOTP}</td>
                                        <td>${ITEMGROUP.item1.modifiedDate}</td>
                                        <td><a href="${contextPath}/admin/group/removeitem/${ITEMGROUP.iGId}">Delete</a></td>

                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>

                        <h4>Remove item</h4>
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
                            <c:forEach items="${ITEMGROUP_LIST}" var="ITEMGROUP">
                                <c:if test="${ITEMGROUP.groups1.groupId != GROUP.groupId}">
                                    <tr>
                                        <td>${ITEMGROUP.item1.itemId}</td>

                                        <td>${ITEMGROUP.item1.name}</td>

                                        <td>${ITEMGROUP.item1.type}</td>

                                        <td>${ITEMGROUP.item1.description}</td>

                                        <td>${ITEMGROUP.item1.defMP}</td>

                                        <td>${ITEMGROUP.item1.defOTP}</td>

                                        <td>${ITEMGROUP.item1.modifiedDate}</td>

                                        <td><a href="${contextPath}/admin/group/add/${ITEMGROUP.item1.itemId}/${GROUP.groupId}">Add</a></td>

                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>

                        <!--div class="row">
                            <div class="col-lg-12">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span class="small">Group Id :</span></div>
                                            <div class="col-lg-8">${(GROUP.groupId)}</div>
                                        </div>
                                    </a>             
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                            <div class="col-lg-4"><span class="small">Name :</span></div>
                                            <div class="col-lg-8">${(GROUP.name)}</div>
                                        </div>
                                    </a>             

                                </div>
                            </div-->
                            <!-- /.col-lg-6 (nested) -->
                            <a href="${contextPath}/admin/group/list" class="btn btn-default"><i class="fa fa-arrow-circle-left fa-fw"></i>Back</a>
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
