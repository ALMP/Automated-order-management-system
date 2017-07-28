<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ include file="/webresources/common/header.jspf"%>
<div class="container">
  <div class="row">
    <div class="span12">
      <div class="hero-unit center">
        <h1>Page Not Found <small><font face="Tahoma" color="red">Error 404</font></small></h1>
        <br />
        <p>The page you requested could not be found, either contact your webmaster or try again. Use your browsers <b>Back</b> button to navigate to the page you have prevously come from</p>
        <p><b>Or you could just press this neat little button:</b></p>
        <a href="${contextPath}" class="btn btn-large btn-info"><i class="icon-home icon-white"></i> Take Me Home</a>
      </div>
      <br />
    </div>
  </div>
</div>

</body>
</html>