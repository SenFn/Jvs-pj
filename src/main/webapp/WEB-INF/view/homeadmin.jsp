<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Management</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="${pageContext.request.contextPath}/resources/assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <body>



        <div id="wrapper">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="adjust-nav">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#" >
                            <img src="${pageContext.request.contextPath}/resources/images/login_admin.png" alt="">
                        </a>

                    </div>

                    <span class="logout-spn" >
                       <c:url value="/logout" var="logoutUrl" />
                        <form id="logout" action="${logoutUrl}" method="post" >
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <a href="javascript:document.getElementById('logout').submit()">LOGOUT</a>
                        </c:if>

                    </span>
                </div>
            </div>
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">



                        <li class="active-link">
                            <a href="index.html" ><i class="fa fa-desktop "></i>Dashboard <span class="badge">Included</span></a>
                        </li>


                     

                    </ul>
                </div>

            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>ADMIN DASHBOARD</h2>   
                        </div>
                    </div>              
                    <!-- /. ROW  -->
                    <hr />
                     <%--------------------------------  Hiển thị tên admin nếu biết làm thì tốt ------------------------------%>
                    <div class="row">
                        <div class="col-lg-12 ">
                           
                            <div class="alert alert-info">
                                Chào mừng ${tennguoidung} trở lại.
                            </div>

                        </div>
                            <%----------------------------------------------------------------------------------------------%>
                    </div>
                    <!----------------------------------------  Các cột  ----------------------------------------------> 
                    
                    
                    <div class="row text-center pad-top">
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                            <div class="div-square">
                                <c:url var="sanpham" value="/sanpham/list"/>
                                <a href="${sanpham}" >
                                    <i class="fa fa-circle-o-notch fa-5x"></i>
                                    <h4>Sản phẩm</h4>
                                </a>
                            </div>


                        </div> 

                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                            <div class="div-square">
                               <c:url var="khachhang" value="/khachhang/list"/>
                                <a href="${khachhang}" >
                                    <i class="fa fa-users -o fa-5x"></i>
                                    <h4>Khách hàng</h4>
                                </a>
                            </div>



                        </div>
                     
                        

                        </div>
                      
                    </div>   
                    <!-- /. ROW  -->    
                    <div class="row text-center pad-top">



                            <!-- /. ROW  --> 
                        </div>
                        <!-- /. PAGE INNER  -->
                    </div>
                    <!-- /. PAGE WRAPPER  -->
                </div>
                <div class="footer">


                    <div class="row">
                        <div class="col-lg-12" >
                            &copy;  2021 router.h2l.company@gmail.com</a>
                        </div>
                    </div>
                </div>


                <!-- /. WRAPPER  -->
                <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
                <!-- JQUERY SCRIPTS -->
                <script src="assets/js/jquery-1.10.2.js"></script>
                <!-- BOOTSTRAP SCRIPTS -->
                <script src="assets/js/bootstrap.min.js"></script>
                <!-- CUSTOM SCRIPTS -->
                <script src="assets/js/custom.js"></script>


                </body>
                </html>
