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
                        <h5><i class="fa fa-edit fa-fw"></i> <b> Update Customer</b></h5> 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="${contextPath}/cabinet/customer/update" method="POST">
                                    <div class="form-group">
                                        <label for="firstName">First Name</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z]+" name="firstName" path="firstName" title="Only english letters"  value="${CUSTOMER.firstName}" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName">Last Name</label>
                                        <input class="form-control" type="text" pattern="[a-zA-Z]+" name="lastName" path="lastName"  value="${CUSTOMER.lastName}" title="Only english letters" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="contact">Contact</label>
                                        <input class="form-control" type="number" name="contact" path="contact" value="${CUSTOMER.contact}" required />
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input class="form-control" type="email" name="email" path="email" value="${CUSTOMER.email}" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input class="form-control" type="text" pattern = "#^\+[0-9]{1,2}\s?\([0-9]{3}\)\s?[0-9]+\-[0-9]+\-[0-9]+$#" name="phone" path="phone" value="${CUSTOMER.phone}" required/>
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" type="text" name="location" path="location" value="${CUSTOMER.location}" required />
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" type="text" name="customerId" path="customerId" value="${CUSTOMER.customerId}" required />
                                    </div>
                                    <h2>Customer address</h2>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label for="addressLine">Address Line</label>
                                            <input class="form-control" type="text" pattern="[a-zA-Z0-9- ]+" name="addressLine" path="addressLine" value="${ADDRESS.addressLine}" title="Only numbers and english letters" required/>
                                        </div>
                                        <div class="form-group">
                                            <label for="city">City</label>
                                            <input class="form-control" type="text" pattern="[a-zA-Z]+" name="city" path="city" value="${ADDRESS.city}" title="Only english letters" required />
                                        </div>
                                        <div class="form-group">
                                            <label for="country">Country</label>
                                            <input class="form-control" type="text" pattern="[a-zA-Z]+" name="country"  value="${ADDRESS.country}" title="Only english letters" list="country_list" required />
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
                                            <input class="form-control" type="number" name="postalCode" path="postalCode" value="${ADDRESS.postalCode}" required />
                                        </div>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>Update</button>
                                    <a href="${contextPath}/cabinet/customerinfo" class="btn btn-default"><i class="fa fa-close fa-fw"></i>Cancel</a>
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
