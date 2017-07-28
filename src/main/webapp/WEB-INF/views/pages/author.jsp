<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>22 лучших формы входа и регистрации на сайте в HTML&CSS! | Vladmaxi.net</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">

</head>
<body>

<!-- vladmaxi top bar -->
<div class="vladmaxi-top">
    <a href="http://vladmaxi.net" target="_blank">Главная Vladmaxi.net</a>
    <span class="right">
            <a href="http://vladmaxi.net/web-developer/css/sbornik-22-luchshix-form-vxoda-registracii-na-sajt-html-css.html">
                <strong>Вернуться назад к статье</strong>
            </a>
        </span>
    <div class="clr"></div>
</div>
<!--/ vladmaxi top bar -->

${log}

<form role="form" action="${contextPath}/admin/admin/item/author" method="POST">
    <p>
        <label for="login">Login</label>
        <input class="form-control" type="text" name="login" path="login" required="required" autofocus="autofocus"/>
    </p>
    <p>
        <label for="password">Password</label>
        <input class="form-control" type="password" name="password" path="password" required="required" />
    </p>
    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Submit</button>
</form>
</body>
</html>


<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
