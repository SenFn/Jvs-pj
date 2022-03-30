<%@page import="com.mycompany.entity.SanPham"%>
<%@page import="com.mycompany.entity.ThongTinSanPham"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html xmlns:th="http://www.thymeleaf.org">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/info-form/fonts/icomoon/style.css">


	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/info-form/css/bootstrap.min.css">

	<!-- Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/info-form/css/style.css">

	<title>Info Form</title>
</head>

<body>
<c:if test="${save != null and save == 1}">
	<script>alert("Input information null!")</script>
</c:if>

<c:if test="${save != null and save == 2}">
	<script>alert("Password not equals!")</script>
</c:if>

<c:if test="${save != null and save == 0}">
	<script>alert("Save information succeed!")</script>
</c:if>
<div class="content">

	<div class="container">
		<div class="row align-items-stretch justify-content-center no-gutters">
			<div class="col-md-7">
				<div class="form h-100 contact-wrap p-5">
					<h3 class="text-center">Informations</h3>

					<c:url var="save" value="/saveInfo">

					</c:url>
					<form class="mb-5" method="POST" action="${save}">
						<div class="row">
							<div class="col-md-6 form-group mb-3">
								<label class="col-form-label">Name </label>
								<input type="text" class="form-control" name="name" id="name" placeholder="Your name" value="${username}" th:name="name" readonly>
							</div>
							<div class="col-md-6 form-group mb-3">
								<label class="col-form-label">Email </label>
								<input type="email" class="form-control" name="email" id="email"  placeholder="Your email"  value="${email}" th:name="email">
							</div>
						</div>

						<div class="row">
							<div class="col-md-12 form-group mb-3">
								<label class="col-form-label">Phone</label>
								<input type="text" class="form-control" name="phone" id="phone" placeholder="Your phone" value="${phone}" th:name="phone">
							</div>
						</div>

						<div class="row">
							<div class="col-md-12 form-group mb-3">
								<label class="col-form-label">New Password</label>
								<input type="text" class="form-control" name="newpassword" id="newpassword" placeholder="Your new password" th:name="newpassword">
							</div>
						</div>

						<div class="row">
							<div class="col-md-12 form-group mb-3">
								<label class="col-form-label">Comfirm password</label>
								<input type="text" class="form-control" name="newpassword1" id="newpassword1" placeholder="Repeat password" th:name="newpassword1" >
							</div>
						</div>


						<div class="row justify-content-center">
							<div class="col-md-5 form-group text-center">
								<input type="submit" value="Save" class="btn btn-block btn-primary rounded-0 py-2 px-4">

							</div>
						</div>

						<div class="row justify-content-center">
							<div class="col-md-5 form-group text-center">
								<button class="btn btn-block btn-primary rounded-0 py-2 px-4" style="background-color:gray;" type="button" onclick="window.location.href='<%=request.getContextPath()%>/index'">Go to Homepage</button>

							</div>
						</div>
						<input type="hidden"
							   name="${_csrf.parameterName}"
							   value="${_csrf.token}" />
					</form>


				</div>
			</div>
		</div>
	</div>

</div>



<script src="${pageContext.request.contextPath}/resources/info-form/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/info-form/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/info-form/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/info-form/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/info-form/js/main.js"></script>
</body>

</html>