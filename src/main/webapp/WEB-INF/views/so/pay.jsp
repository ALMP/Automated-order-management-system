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
                                <th>Pay type</th>
                                <th>Info</th>
                                <th>Date</th>
                                <th>Month pay</th>
                                <th>One-time pay</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${PAY}" var="D">
                                <tr>
                                    <td>${D.paymenttype1.typeName}</td>
                                    <td>${D.paymentInfo}</td>
                                    <td>${D.paymentDate}</td>
                                    <td>${D.paymentbill1.cmp}</td>
                                    <td>${D.paymentbill1.cotp}</td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


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
