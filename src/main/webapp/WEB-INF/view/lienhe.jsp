<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        </<script type="text/javascript">

        </script>
        <!-- Required meta tags -->
        <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <title>Web bán thiết bị mạng</title>

                <!-- Bootstrap CSS -->
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">
                    <!-- google font web -->
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/bootstrap/css/bootstrap.min.css">
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/font-awesome/css/font-awesome.min.css">
                            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
                                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
                                    <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
                                    <!-- Custom css - Các file css do chúng ta tự viết -->
                                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-detail.css" type="text/css">
                                        </head>
                                        <body>
                                            <header>
                                                <div class="top">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                                <p>
                                                                    Welcome to the world of network equipment
                                                                </p>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                                <div class="main-menu-header">

                                                                    <div id="nav-menu">
                                                                        <ul>
                                                                            <li><a href="#">Cửa hàng</a></li>

                                                                            <c:url var="dangnhapUrl" value="/showMyLoginPage" />
                                                                            <c:if test="${pageContext.request.userPrincipal.name == null}">
                                                                                <li><a  href="${dangnhapUrl}">Đăng nhập</a></li>
                                                                            </c:if>
                                                                            <li>
                                                                                <a href="#">Tài Khoản</a>
                                                                                <ul>
                                                                                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                                                                                        <li><a href="${pageContext.request.contextPath}/register/showRegistrationForm">Đăng ký</a></li>
                                                                                    </c:if>

                                                                                    <c:url var="giohanglistUrl" value="/giohang/list" >
                                                                                        <c:param name="giohangId" value="${giohangId}" />
                                                                                        <c:param name="soluongsp" value="${soluongsanpham}" />
                                                                                        <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                                                    </c:url>
                                                                                    <li><a href="${giohanglistUrl}">Giỏ Hàng</a></li>

                                                                                    <li>
                                                                                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                                                                                        <a href="${pageContext.request.contextPath}/info">Thông tin</a>
                                                                                        </c:if>
                                                                                        <c:url value="/logout" var="logoutUrl" />
                                                                                        <form id="logout" action="${logoutUrl}" method="post" >
                                                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                                        </form>
                                                                                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                                                                                        <a href="javascript:document.getElementById('logout').submit()">Đăng Xuất</a>
                                                                                        </c:if>
                                                                                </ul>
                                                                            </li>

                                                                            <c:url var="lienhe" value="/lienhe" />

                                                                            <li><a href="${lienhe}">Liên hệ</a></li>

                                                                            <security:authorize access="hasAnyRole('ADMIN')">
                                                                                <c:url var="homeadmin" value="/homeadmin" />
                                                                                <li><a href="${homeadmin}">Admin</a></li>
                                                                            </security:authorize>

                                                                        </ul>
                                                                        <div class="clear"></div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="main-header">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-6 col-xs-6 col-sm-6 col-md-3 col-lg-3 order-md-0 order-0">
                                                                <div class="logo">
                                                                    <a href="<%=request.getContextPath()%>/index"><img src="${pageContext.request.contextPath}/resources/images/logo6.png" alt=""></a>
                                                                    <h1>Website bán hàng</h1>
                                                                </div>
                                                            </div>
                                                            <div class="col-12 col-xs-12 col-sm-12 col-md-6 col-lg-6 order-md-1 order-2">
                                                                <div class="form-seach-product">


                                                                    <div class="input-seach">
                                                                        <c:url var="search" value="/search">
                                                                            <c:param name="giohangId" value="${giohangId}" />
                                                                            <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                                        </c:url>
                                                                        <form:form action="${search}" method="GET">
                                                                            <input type="text" placeholder="Wifi/router/kích sóng wifi..." name="theSearchName"  class="form-control">
                                                                            <button type="submit" class="btn-search-pro"><i class="fa fa-search"> </i></button>
                                                                        </form:form>
                                                                    </div>
                                                                    <div class="clear"></div>

                                                                </div>
                                                            </div>
                                                            <div class="col-6 col-xs-6 col-sm-6 col-md-3 col-lg-3 order-md-2 order-1" style="text-align: right">
                                                                <a href="#" class="icon-cart">
                                                                    <div class="icon" >

                                                                        <a href="${giohanglistUrl}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                                                        <!-- class gio hang -->
                                                                        <span><c:out value="${soluongsanpham}"/></span>
                                                                    </div>
                                                                    <div class="info-cart">
                                                                        <p>Giỏ hàng</p>
                                                                        <c:if test="${tennguoidung != '0'}">
                                                                            <span>Người Dùng: <c:out value="${tennguoidung}"/></span>
                                                                        </c:if>
                                                                        <c:if test="${tennguoidung == '0'}">
                                                                            <span>Người Dùng: Chưa Đăng Nhập </span>
                                                                        </c:if>

                                                                    </div>

                                                                    <span class="clear"></span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="main-menu-header">
                                                    <div class="container">
                                                        <%--menubar--%>
                                                        <%@ include file="menu.jsp" %>

                                                    </div>
                                                </div>
                                            </header>
                                            <div class="container">
                                                <div class="row" style="border-bottom : 1px solid #000000">
                                                    <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-9">
                                                        <div class="product-section">
                                                            <h2 class="title-product">
                                                                <a href="#" class="title">Địa chỉ cửa hàng</a>

                                                            </h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="map text-center">
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15673.682645064993!2d106.785103!3d10.855575!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb6cf10bb7d719327!2sHUTECH%20University%20-%20E%20Campus%20(SHTP)!5e0!3m2!1svi!2sus!4v1625553645545!5m2!1svi!2sus"
                                                            width="90%" height="800px" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                                                </div>
                                                <%--                        footer                    --%>
                                                <%@ include file="footer.jsp" %>
                                                <div class="modal fade" id="btnmodal" tabindex="-1" role="dialog" aria-hidden="true">
                                                    <div class="modal-content modal-dialog">
                                                        <div class="modal-header">
                                                            <h1 class="text-center">Đăng Nhập</h1>
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>


                                                        </div>
                                                        <div class="modal-body">
                                                            <form id="frm" class="horizontal-form">
                                                                <div class="form-group row">
                                                                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                                        <label class="label-control">Tài Khoản</label>
                                                                    </div>
                                                                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                                                                        <input class="form-control" id="txttk" type="text" placeholder="Tài Khoản" onblur="kiemtrataikhoan()" />
                                                                        <span id="ertk">(*)</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                                        <label class="label-control">Mật Khẩu</label>
                                                                    </div>
                                                                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                                                                        <input class="form-control" id="txtmk" type="text" placeholder="Mật Khẩu" onblur="kiemtramatkhau()" />
                                                                        <span id="ermk">(*)</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                                                        <a href="dangky.html"><span>Đăng ký</span></a>
                                                                    </div>
                                                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                                                        <span><a href="#">Quên mật Khẩu ?</a></span>
                                                                    </div>
                                                                </div>

                                                                <fieldset >
                                                                    <legend>Hoặc</legend>
                                                                    <div class="form-group row">
                                                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                                            <a href="https://www.facebook.com/"><img src="images/fb.PNG" /></a>
                                                                        </div>
                                                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-">
                                                                            <a href="https://www.google.com/"><img src="images/gg.PNG" /></a>
                                                                        </div>
                                                                    </div>
                                                                </fieldset>


                                                            </form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button class="btn btn-success btn-block" id="save" onclick="dangnhap()">Đăng Nhập</button>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                <label class="label-control">&#160</label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <script src="libs/jquery-3.4.1.min.js"></script>
                                                    <script src="libs/bootstrap/js/bootstrap.min.js"></script>
                                                    <script src="js/main.js"></script>
                                                    <div id="fb-root"></div>
                                                    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v6.0"></script>
                                                    <!-- bootstrap cua FB -->
                                                    </body>
                                                    </html>