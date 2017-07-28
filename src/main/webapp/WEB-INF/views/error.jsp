<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../webresources/common/header.jspf"%>

<div id="page-wrapper">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="login-panel panel panel-red">
                <div class="panel-heading">
                    <h3 class="panel-title">Error :</h3>
                </div>

                <label>${message}</label>
                <div class="panel-footer">
                    <a onclick="history.back()" class="btn btn-lg btn-defult btn-block">Retry</a>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="../../webresources/common/footer.jspf"%>
