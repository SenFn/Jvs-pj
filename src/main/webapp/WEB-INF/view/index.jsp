
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>Website bán PC/laptop</title>
                    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">
                        <!-- google font web -->
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/bootstrap/css/bootstrap.min.css">
                            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/font-awesome/css/font-awesome.min.css">
                                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
                                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
                                        <style>
                                            #ertk, #ermk {
                                                color: #ff0000;
                                            }
                                        </style>
                                        <script>
                                            function kiemtrataikhoan() {
                                                var tk = document.getElementById("txttk").value;
                                                var regex = /^[A-Za-z0-9]+[A-Za-z0-9]+$/;
                                                if (regex.test(tk)) {
                                                    document.getElementById("ertk").innerHTML = "";
                                                    return true;
                                                } else {
                                                    document.getElementById("ertk").innerHTML = "Nhập lại tài khoản";
                                                    return false;
                                                }
                                            }
                                            function kiemtramatkhau() {
                                                var mk = document.getElementById("txtmk").value;
                                                var regex = /^[A-Za-z0-9]+[A-Za-z0-9]+$/;
                                                if (regex.test(mk)) {
                                                    document.getElementById("ermk").innerHTML = "";
                                                    return true;
                                                } else {
                                                    document.getElementById("ermk").innerHTML = "Nhập lại mật khẩu";
                                                    return false;
                                                }
                                            }

                                            function dangnhap() {
                                                alert("Đăng nhập thành công ");
                                            }
                                        </script>
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
                                                                            <li><a  href="${dangnhapUrl}">Đăng nhập</a></li>
                                                                            <li>
                                                                                <a href="#">Tài Khoản</a>
                                                                                <ul>
                                                                                    <li><a href="${pageContext.request.contextPath}/register/showRegistrationForm">Đăng ký</a></li>
                                                                                        <c:url var="giohanglistUrl" value="/giohang/list" >   
                                                                                            <c:param name="giohangId" value="${giohangId}" />
                                                                                            <c:param name="soluongsp" value="${soluongsanpham}" />
                                                                                            <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                                                        </c:url>
                                                                                    <li><a href="${giohanglistUrl}">Giỏ Hàng</a></li>
                                                                                    <li>
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
                                                                    <a <a href="<%=request.getContextPath()%>/index"><img src="${pageContext.request.contextPath}/resources/images/logo6.png" alt=""></a>
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
                                                        <div id="nav-menu">
                                                            <ul>
                                                                <li class="current-menu-item"><a href="<%=request.getContextPath()%>/index">Trang chủ</a></li>
                                                                <li><a href="<%=request.getContextPath()%>/gioithieu">Giới thiệu</a></li>
                                                                <li>
                                                                    <a href="#">Sản phẩm</a>
                                                                    <ul>
                                                                        <li><a href="#">Router</a></li>
                                                                        <li><a href="#">Cáp Mạng</a></li>
                                                                        <li><a href="#">Hub mạng</a></li>
                                                                        <li><a href="#">Sản phẩm khác</a></li>
                                                                    </ul>
                                                                </li>
                                                                <li><a href="#">Tin tức</a></li>
                                                                <li><a href="#">Tuyển dụng</a></li>
                                                                <li><a href="<%=request.getContextPath()%>/lienhe">Liên hệ</a></li>
                                                            </ul>
                                                            <div class="clear"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </header>
                                            <div id="content">
                                                <div class="container">
                                                    <div class="slider">
                                                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                                            <div class="carousel-inner">
                                                                <div class="carousel-item active">
                                                                    <!-- item start -->
                                                                    <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/qc3.jpg" alt="First slide">
                                                                        <!-- Width =100% -->
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img class="img-reponsive" src="${pageContext.request.contextPath}/resources/images/qc2.jpg" alt="Second slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <!-- slide img -->
                                                                    <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/qc3.jpg" alt="Three slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/qc5.jpg" alt="Four slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/qc7.jpg" alt="Five slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/qc4.jpg" alt="six slide">
                                                                </div>
                                                            </div>
                                                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                                                <!-- nút trước -->
                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                                                <!--nút sau -->
                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-box">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3 ">
                                                                <div class="sidebar">
                                                                    <div class="category-box">
                                                                        <h3>Danh mục sản phẩm</h3>
                                                                        <div class="content-cat">
                                                                            <ul>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Router</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Hub chuyển đổi</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Hub Mạng</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Hub 3G</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Hub 4G</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Bộ Tăng sóng</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Chuột</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Tai nghe</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="#">Sản phẩm khác</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="widget">
                                                                        <h3>
                                                                            <i class="fa fa-bars"></i>
                                                                            Tin tức
                                                                        </h3>
                                                                        <div class="content-w">
                                                                            <ul>
                                                                                <li>
                                                                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/images/1.jpg" alt=""></a>
                                                                                    <h4><a href="#">Laptop Lenovo L340-15IRH 81LK01GKVN giảm giá 10%</a></h4>
                                                                                    <div class="clear"></div>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/images/2.jpg" alt=""></a>
                                                                                    <h4><a href="#">Laptop ASUS Gaming FX505DT-AL118T giảm giá 2 triệu</a></h4>
                                                                                    <div class="clear"></div>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/images/3.jpg" alt=""></a>
                                                                                    <h4><a href="#">Apple Macbook Pro 13 Touch Bar i5 1.4 256GB 2020 giảm giá mạnh đối với sinh viên</a></h4>
                                                                                    <div class="clear"></div>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/images/4.jpg" alt=""></a>
                                                                                    <h4><a href="#">Laptop Acer Nitro 5 AN515-55-58A7 Giảm giá 20%</a></h4>
                                                                                    <div class="clear"></div>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/images/5.jpg" alt=""></a>
                                                                                    <h4><a href="#">Laptop HP ENVY 13-AQ1021TU 8QN79PA giảm giá shock</a></h4>
                                                                                    <div class="clear"></div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="widget">
                                                                        <h3>
                                                                            <i class="fa fa-bars"></i>
                                                                            Quảng cáo
                                                                        </h3>
                                                                        <div class="content-banner">
                                                                            <a href="#">
                                                                                <img src="${pageContext.request.contextPath}/resources/images/banner.png" alt="">
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="widget">
                                                                        <h3>
                                                                            <i class="fa fa-facebook"></i>
                                                                            Facebook
                                                                        </h3>
                                                                        <div class="content-fb">
                                                                            <div class="fb-page" data-href="#" data-tabs="timeline" data-width="" data-height="200" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9 ">
                                                                <div class="product-section">
                                                                    <h2 class="title-product">
                                                                        <a href="#" class="title">Sản phẩm nổi bật</a>
                                                                        <div class="bar-menu"><i class="fa fa-bars"></i></div>
                                                                        <div class="list-child">
                                                                            <ul>
                                                                                <li><a href="#">Máy tính bàn</a></li>
                                                                                <li><a href="#">Macbook</a></li>
                                                                                <li><a href="#">Laptop</a></li>
                                                                                <li><a href="#">Phụ kiện</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="clear"></div>
                                                                    </h2>
                                                                    <!-- -------------------------SẢN PHẦM ĐƯỢC THÊM AUTO Ở ĐÂY  ---------------------------------- -->
                                                                    <%
                                                                        double tongtien = 0;
                                                                        String onclick = "index";
                                                                    %>
                                                                    <c:if test="${!empty giohang}">
<%--                                                                        <%--%>
<%--                                                                            GioHang gioHang = (GioHang) request.getAttribute("giohang");--%>
<%--                                                                            int maghh = gioHang.getMaghh();--%>
<%--                                                                            String giohangId = String.valueOf(maghh);--%>
<%--                                                                            // double giatong = gioHang.getTongtien();--%>
<%--                                                                            session.setAttribute("giohangId", giohangId);--%>
<%--                                                                            //hongTinSanPham thongTinSanPham = (ThongTinSanPham) request.getAttribute("thongtinsanphams");--%>
<%--%>--%>
                                                                    </c:if>
                                                                    <c:forEach items="${sanphams}" var="sanpham" >
                                                                        <c:url var="thongtinsanphamUrl" value="/thongtinsanpham/list">
                                                                            <c:param name="sanphamId" value="${sanpham.masp}" />
<%--                                                                            <c:param name="giohangId" value="${giohangId}" />--%>
<%--                                                                            <c:param name="onclick" value="<%= onclick%>" />--%>
<%--                                                                            <c:param name="soluongsanpham"   value="${soluongsanpham}" />--%>
<%--                                                                            <c:param name="tennguoidung"   value="${tennguoidung}" />  --%>
                                                                        </c:url>

                                                                        <script type="text/javascript">

                                                                            function AlertIt() {
                                                                                confirm("Cảm ơn bạn đã yêu thích sản phẩm: ${sanpham.tenSanPham}");

                                                                            }
                                                                        </script>


                                                                        <div class="content-product-box" style="display: inline-block; align-content: center">

                                                                            <div class="item-product ">
                                                                                <div class="thumb">
                                                                                    <a href="${thongtinsanphamUrl}" ><img src="data:image/png;base64,${sanpham.imgSp}" style="width: 180px; height: 180px"></a>
                                                                                    <span class="sale">Giảm <br>10%</span>
                                                                                    <div class="action">
                                                                                        <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                        <a href="javascript:AlertIt();" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                        <div class="clear"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="info-product " style="width: 180px; height: 200px">
                                                                                    <h4><a href="${thongtinsanphamUrl}" ><c:out value="${sanpham.tenSanPham}"/></a></h4>
                                                                                    <div class="price">
                                                                                        <span class="price-current"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sanpham.giaSanPham}" />đ</span>
                                                                                        <span class="price-old">990.000₫</span>
                                                                                    </div>
                                                                                    <a href="${thongtinsanphamUrl}" class="view-more">Xem chi tiết</a>

                                                                                </div>

                                                                            </div>
                                                                        </div>

                                                                    </c:forEach>
                                                                </div>
                                                                <!-- ----------------------------------------------------- ---------------------------------- -->
                                                                <a href="#"><img class="img-reponsive" src="${pageContext.request.contextPath}/resources/images/banner-02.jpg" alt=""></a>

                                                                <br>
                                                                    <br>
                                                                        <div class="product-section">
                                                                            <h2 class="title-product">
                                                                                <a href="#" class="title">Phụ Kiện</a>
                                                                                <div class="bar-menu"><i class="fa fa-bars"></i></div>
                                                                                <div class="list-child">
                                                                                    <ul>
                                                                                        <li><a href="#">PC</a></li>
                                                                                        <li><a href="#">Bàn Phím</a></li>
                                                                                        <li><a href="#">Tai Nghe</a></li>
                                                                                        <li><a href="#">Chuột</a></li>
                                                                                    </ul>
                                                                                </div>
                                                                                <div class="clear"></div>
                                                                            </h2>
                                                                            <div class="content-product-box">
                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/pc.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>15%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Gaming PC - Glacier RX570 - R3 2300X/ A320M/ 8GB/ 120GB/ RX570/ 450W</a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">8.990.000₫</span>
                                                                                                    <span class="price-old">10.990.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/pc1.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>10%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Gaming PC - Alpha 9100 Plus - i3 9100/ B365M/ 8GB/ 120GB/ 450W</a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">3.790.000₫</span>
                                                                                                    <span class="price-old">4.790.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/pc2.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>15%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Gaming PC - Dante 2060 - i3 9100F/B365/ 8GB/ 120GB/ RTX 2060/ 550W</a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">10.990.000₫</span>
                                                                                                    <span class="price-old">13.990.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/pc3.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>10%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Gaming PC - Nova 2070 9th - i5 9400F/ B360/ 16GB/ 240GB SSD/ RTX 2070 8G/ 650W</a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">3.790.000₫</span>
                                                                                                    <span class="price-old">4.790.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/bp.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>10%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Bàn phím cơ Steelseries Apex 7 </a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">4.790.000₫</span>
                                                                                                    <span class="price-old">4.790.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/bp1.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>15%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Bàn phím cơ Dareu DK1280 RGB </a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">1.690.000₫</span>
                                                                                                    <span class="price-old">1.990.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/tn.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>10%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Tai nghe chụp tai Gaming 7.1 Rapoo VH510</a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">690.000₫</span>
                                                                                                    <span class="price-old">790.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                                                        <div class="item-product">
                                                                                            <div class="thumb">
                                                                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/chuot.jpg" alt=""></a>
                                                                                                <span class="sale">Giảm <br>15%</span>
                                                                                                <div class="action">
                                                                                                    <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                                    <a href="#" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                                    <div class="clear"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="info-product">
                                                                                                <h4><a href="#">Chuột Gaming Asus TUF M3</a></h4>
                                                                                                <div class="price">
                                                                                                    <span class="price-current">590.000₫</span>
                                                                                                    <span class="price-old">690.000₫</span>
                                                                                                </div>
                                                                                                <a href="#" class="view-more">Xem chi tiết</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        </div>
                                                                        </div>
                                                                        </div>
                                                                        </div>
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
                                                                                                    <a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/images/fb.PNG" /></a>
                                                                                                </div>
                                                                                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-">
                                                                                                    <a href="https://www.google.com/"><img src="${pageContext.request.contextPath}/resources/images/gg.PNG" /></a>
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
                                                                            <!--		
                                                                                            
                                                                                    </body>
                                                                            </html>