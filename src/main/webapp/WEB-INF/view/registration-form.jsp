<%@page import="com.mycompany.entity.GioHang"%>
<%@page import="com.mycompany.entity.SanPham"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8">
      <title>Register</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">

                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">
                    <!-- google font web -->
                    <link href="${pageContext.request.contextPath}/resources/libs/bootstrap/css/bootstrap.min.css"  rel="stylesheet" type="text/css">
                        <script src="<c:url value='/resources/libs/jquery/jquery-3.5.0.min.js'/>"></script>
                        <script src="<c:url value='/resources/libs/bootstrap/bootstrap.min.js'/>"></script>
                        <style>
                            html, body {
                                width: 100%;
                                height:100%;
                            }

                            body {
                                background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
                                background-size: 400% 400%;
                                animation: gradient 15s ease infinite;
                            }

                            @keyframes gradient {
                                0% {
                                    background-position: 0% 50%;
                                }
                                50% {
                                    background-position: 100% 50%;
                                }
                                100% {
                                    background-position: 0% 50%;
                                }
                            }
                        </style>
                        <script>

                        </script>
</head>

            <body>

                            <div>

                                <div id="loginbox" style="margin-left:630px ; margin-block: 200px"
                                     class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

                                    <div class="panel panel-primary">



                                        <div style="padding-top: 30px" class="panel-body">
                                            <div class="panel-heading">
                                                <h1 class="panel-title text-center">Đăng ký</h1>
                                            </div>
                                            <!-- Registration Form -->
                                            <script>
                                                submitForms = function () {
                                                    let user = document.getElementById("userName").value;
                                                    let pass = document.getElementById("password").value;
                                                    let phone = document.getElementById("soDienThoaikh").value;
                                                    let mail = document.getElementById("email").value;
                                                    if(user == "" || user == null || pass == "" || pass == null || phone == "" || phone == null || mail == "" || mail == null){
                                                        alert("Input not allow null!");
                                                        return;
                                                    }
                                                    //alert("Đăng kí tài khoản thành công");
                                                    document.getElementById("form1").submit();
                                                }
                                            </script>
                                            <form:form  id="form1" action="${pageContext.request.contextPath}/register/processRegistrationForm"
                                                       modelAttribute="crmUser"
                                                       class="form-horizontal" >

                                                <!-- Place for messages: error, alert etc ... -->
                                                <div class="form-group">
                                                    <div class="col-xs-15">
                                                        <div>

                                                            <!-- Check for registration error -->
                                                            <c:if test="${registrationError != null}">

                                                                <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                                                    ${registrationError}
                                                                </div>

                                                            </c:if>

                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- User name -->
                                                <div style="margin-bottom: 25px" class="input-group">

                                                    <form:errors path="userName" cssClass="text-danger" />
                                                    <form:input path="userName" placeholder="username" class="form-control" />
                                                </div>

                                                <!-- Password -->
                                                <div style="margin-bottom: 25px" class="input-group">

                                                    <form:password path="password" placeholder="password" class="form-control" />
                                                </div>
                                                    <form:form  modelAttribute="khachhang" class="form-horizontal">
                                                        <!-- - - - - - - - - - - - - - - - Validate - - - - - - - - - -->
                                                        <form:errors path="soDienThoaikh" cssClass="text-danger"/>
                                                    <form:input path="soDienThoaikh" placeholder="số điện thoại" class="form-control"  />
                                                    </br>
                                                    <form:errors path="email" cssClass="text-danger"/>
                                                    <form:input  path="email" placeholder="email" class="form-control" />

                                                </form:form>



                                            </form:form>
                                            <!-- Register Button -->
                                            <div style="margin-top: 10px" class="text-center d-flex justify-content-center">
                                                <div class="col-sm-6">
                                                    <button onclick="submitForms()" class="btn btn btn-outline-primary btn-lg">Đăng ký</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center p-t-115">
                                        <span class="txt1">
                                            Have an account?
                                        </span>
                                            <c:url var="dangnhapUrl" value="/showMyLoginPage" />
                                            <a class="txt2" href="${dangnhapUrl}">
                                                Login
                                            </a>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </body>
                        </html>