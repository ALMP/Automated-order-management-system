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
                        <h5><i class="fa fa-plus-square fa-fw"></i> <b> Create a new Customer </b></h5>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/admin/customer/new" method="POST">
                                    <h4>Customer information</h4>
                                    <div class="form-group">
                                        <label for="firstName">First Name</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z]+" name="firstName" path="firstName" title="Only english letters" required="required"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName">Last Name</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z]+" name="lastName" path="lastName" title="Only english letters" required="required"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="contact">Contact</label>
                                        <input class="form-control" type="number" name="contact" path="contact" required="required"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input class="form-control" type="email" name="email" path="email" required="required"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input class="form-control" type="number" pattern = "#^\+[0-9]{1,2}\s?\([0-9]{3}\)\s?[0-9]+\-[0-9]+\-[0-9]+$#" name="phone" path="phone" required="required"  />
                                    </div>
                                    <h4>Customer address</h4>
                                    <div class="form-group">
                                        <label for="addressLine">Address Line</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z0-9- ]+" name="addressLine" path="addressLine"  title="Only numbers and english letters" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <label for="city">City</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z]+" name="city" path="city" title="Only english letters" required="required"  />
                                    </div>
                                    <div class="form-group">
                                        <label for="country">Country</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z]+" name="country" path="country" title="Only english letters" list="country_list" required required="required" />
                                        <datalist id="country_list">
                                            <option>Belarus</option>
                                            <option>Russia</option>
                                            <option>Ukraine</option>
                                            <option>Poland</option>
                                            <option>Czech</option>
                                            <option>Slovakia</option>
                                            <option>Serbia</option>
                                        </datalist>
                                    </div>
                                    <div class="form-group">
                                        <label for="postalCode">Postal Code</label>
                                        <input class="form-control" type="number" name="postalCode" path="postalCode"  />
                                    </div>
                                    <div class="form-group">
                                        <label>User</label>
                                        <select path="user1" name="user1" onchange=" ">
                                            <c:forEach items="${USER_LIST}" var="USER">
                                                <option value="${USER.id}">${USER.username}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Submit</button>
                                    <a href="${contextPath}/admin/customer/list" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
