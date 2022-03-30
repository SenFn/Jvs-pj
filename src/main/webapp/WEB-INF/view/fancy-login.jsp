<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Login </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">

        <!-- google font web -->
        <link href="${pageContext.request.contextPath}/resources/libs/bootstrap/css/bootstrap.min.css"  rel="stylesheet" type="text/css">
        <script src="<c:url value='${pageContext.request.contextPath}/resources/libs/jquery/jquery-3.5.0.min.js'/>"></script>
        <script src="<c:url value='${pageContext.request.contextPath}/resources/libs/bootstrap/bootstrap.min.js'/>"></script>

        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/Login_v2/images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/css/util.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Login_v2/css/main.css">
    </head>
    <%---------------------------------------------- Phần Body  ------------------------------------------------------------------%>
    <body>
        <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">


                        <!-- Login Form -->
                        <%
                            String a = "maivana";
                        %>

                        <c:url var="loginUrl" value="/authenticateTheUser">

                        </c:url>
                        <form action="${loginUrl}" method="POST" class="login100-form validate-form">

                            <!-- Place for messages: error, alert etc ... -->
                            <div class="form-group">
                                <div class="col-xs-15">
                                    <div>

                                        <!-- Check for login error -->

                                        <c:if test="${param.error != null}">

                                            <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                                Invalid username and password.
                                            </div>

                                        </c:if>

                                        <!-- Check for logout -->

                                        <c:if test="${param.logout != null}">

                                            <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                                You have been logged out.
                                            </div>

                                        </c:if>

                                    </div>
                                </div>
                            </div>

                            <span class="login100-form-title p-b-26">
                                Welcome
                            </span>

                            <div class="wrap-input100 validate-input">
                                <input class="input100" type="text" name="username" >
                                <span class="focus-input100" data-placeholder="Username"></span>
                            </div>

                            <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                                <input class="input100" type="password" name="password" >
                                <span class="focus-input100" data-placeholder="Password"></span>
                            </div>

                            <div class="container-login100-form-btn">
                                <div class="wrap-login100-form-btn">
                                    <div class="login100-form-bgbtn"></div>
                                    <button type="submit" class="login100-form-btn">
                                        Login
                                    </button>
                                </div>
                            </div>
                            <!-- I'm manually adding tokens ... Bro! -->

                            <input type="hidden"
                                   name="${_csrf.parameterName}"
                                   value="${_csrf.token}" />
                        </form>

                        <div class="text-center p-t-115">
					<span class="txt1">
						Don’t have an account?
					</span>

                            <a class="txt2" href="${pageContext.request.contextPath}/register/showRegistrationForm">
                                Sign Up
                            </a>
                        </div>


                </div>




        <div id="dropDownSelect1"></div>

        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/animsition/js/animsition.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/bootstrap/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/daterangepicker/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/daterangepicker/daterangepicker.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/vendor/countdowntime/countdowntime.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login_v2/js/main.js"></script>
    </body>
</html>