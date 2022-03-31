
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
                    <title>Web bán thiết bị mạng</title>
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

                                            select {

                                                /* styling */
                                                background-color: white;
                                                border: thin solid #47474b;
                                                border-radius: 4px;
                                                display: inline-block;
                                                font: inherit;
                                                line-height: 1.5em;
                                                padding: 0.5em 3.5em 0.5em 1em;

                                                /* reset */

                                                margin: 0;
                                                -webkit-box-sizing: border-box;
                                                -moz-box-sizing: border-box;
                                                box-sizing: border-box;
                                                -webkit-appearance: none;
                                                -moz-appearance: none;
                                                font-size: small;
                                            }


                                            /* arrows */

                                            select.classic {
                                                background-image:
                                                        linear-gradient(45deg, transparent 50%, #3c3c42 50%),
                                                        linear-gradient(135deg, #3f3f42 50%, transparent 50%),
                                                        linear-gradient(to right, skyblue, skyblue);
                                                background-position:
                                                        calc(100% - 20px) calc(1em + 2px),
                                                        calc(100% - 15px) calc(1em + 2px),
                                                        100% 0;
                                                background-size:
                                                        5px 5px,
                                                        5px 5px,
                                                        2.5em 2.5em;
                                                background-repeat: no-repeat;
                                            }

                                            select.classic:focus {
                                                background-image:
                                                        linear-gradient(45deg, white 50%, transparent 50%),
                                                        linear-gradient(135deg, transparent 50%, white 50%),
                                                        linear-gradient(to right, gray, gray);
                                                background-position:
                                                        calc(100% - 15px) 1em,
                                                        calc(100% - 20px) 1em,
                                                        100% 0;
                                                background-size:
                                                        5px 5px,
                                                        5px 5px,
                                                        2.5em 2.5em;
                                                background-repeat: no-repeat;
                                                border-color: grey;
                                                outline: 0;
                                            }




                                            select.round {
                                                background-image:
                                                        linear-gradient(45deg, transparent 50%, gray 50%),
                                                        linear-gradient(135deg, gray 50%, transparent 50%),
                                                        radial-gradient(#ddd 70%, transparent 72%);
                                                background-position:
                                                        calc(100% - 20px) calc(1em + 2px),
                                                        calc(100% - 15px) calc(1em + 2px),
                                                        calc(100% - .5em) .5em;
                                                background-size:
                                                        5px 5px,
                                                        5px 5px,
                                                        1.5em 1.5em;
                                                background-repeat: no-repeat;
                                            }

                                            select.round:focus {
                                                background-image:
                                                        linear-gradient(45deg, white 50%, transparent 50%),
                                                        linear-gradient(135deg, transparent 50%, white 50%),
                                                        radial-gradient(gray 70%, transparent 72%);
                                                background-position:
                                                        calc(100% - 15px) 1em,
                                                        calc(100% - 20px) 1em,
                                                        calc(100% - .5em) .5em;
                                                background-size:
                                                        5px 5px,
                                                        5px 5px,
                                                        1.5em 1.5em;
                                                background-repeat: no-repeat;
                                                border-color: green;
                                                outline: 0;
                                            }





                                            select.minimal {
                                                background-image:
                                                        linear-gradient(45deg, transparent 50%, gray 50%),
                                                        linear-gradient(135deg, gray 50%, transparent 50%),
                                                        linear-gradient(to right, #ccc, #ccc);
                                                background-position:
                                                        calc(100% - 20px) calc(1em + 2px),
                                                        calc(100% - 15px) calc(1em + 2px),
                                                        calc(100% - 2.5em) 0.5em;
                                                background-size:
                                                        5px 5px,
                                                        5px 5px,
                                                        1px 1.5em;
                                                background-repeat: no-repeat;
                                            }

                                            select.minimal:focus {
                                                background-image:
                                                        linear-gradient(45deg, green 50%, transparent 50%),
                                                        linear-gradient(135deg, transparent 50%, green 50%),
                                                        linear-gradient(to right, #ccc, #ccc);
                                                background-position:
                                                        calc(100% - 15px) 1em,
                                                        calc(100% - 20px) 1em,
                                                        calc(100% - 2.5em) 0.5em;
                                                background-size:
                                                        5px 5px,
                                                        5px 5px,
                                                        1px 1.5em;
                                                background-repeat: no-repeat;
                                                border-color: green;
                                                outline: 0;
                                            }


                                            select:-moz-focusring {
                                                color: transparent;
                                                text-shadow: 0 0 0 #000;
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
                                            <div id="content">
                                                <div class="container">
                                                    <div class="slider">
                                                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                                            <div class="carousel-inner">

                                                            </div>
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
                                                                                <li><i class="fa fa-angle-right"></i> <a href="<%=request.getContextPath()%>/sanpham?type=router">Router</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="<%=request.getContextPath()%>/sanpham?type=hub">Hub</a></li>
                                                                                <li><i class="fa fa-angle-right"></i> <a href="<%=request.getContextPath()%>/sanpham?type=other">Sản phẩm khác</a></li>
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
                                                                        <c:if test="${searchString != null}">
                                                                            <a href="#" class="title">Tìm kiếm Sản phẩm "${searchString}"</a>
                                                                            <br>
                                                                            <a href="<%= request.getContextPath() %>/search?theSearchName=${searchString}&orderBy=name" class="title1">   Xếp theo Tên</a>
                                                                            <a href="<%= request.getContextPath() %>/search?theSearchName=${searchString}&orderBy=priceI" class="title1">   Giá tăng</a>
                                                                            <a href="<%= request.getContextPath() %>/search?theSearchName=${searchString}&orderBy=priceD" class="title1">   Giá giảm</a>
                                                                        </c:if>
                                                                        <c:if test="${searchString == null}">
                                                                            <a href="#" class="title">Sản phẩm</a>
                                                                            <br>
                                                                            <a href="<%= request.getContextPath() %>/sanpham?type=${type}&orderBy=name" class="title1">   Xếp theo Tên</a>
                                                                            <a href="<%= request.getContextPath() %>/sanpham?type=${type}&orderBy=priceI" class="title1">   Giá tăng</a>
                                                                            <a href="<%= request.getContextPath() %>/sanpham?type=${type}&orderBy=priceD" class="title1">   Giá giảm</a>
                                                                        </c:if>

                                                                        <div class="bar-menu"><i class="fa fa-bars"></i></div>
<%--                                                                        <div class="list-child">--%>
<%--                                                                            <ul>--%>
<%--                                                                                <li><a href="#">Máy tính bàn</a></li>--%>
<%--                                                                                <li><a href="#">Macbook</a></li>--%>
<%--                                                                                <li><a href="#">Laptop</a></li>--%>
<%--                                                                                <li><a href="#">Phụ kiện</a></li>--%>
<%--                                                                            </ul>--%>
<%--                                                                        </div>--%>
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
                                                                            <div style="width: 200px;">
                                                                            <div class="item-product ">
                                                                                <div class="thumb">
                                                                                    <a href="${thongtinsanphamUrl}" ><img src="data:image/png;base64,${sanpham.imgSp}" style="width: 180px; height: 180px"></a>
<%--                                                                                    <span class="sale" style="right:20px">Giảm <br>10%</span>--%>
                                                                                    <div class="action" style="width:180px">
                                                                                        <a href="#" class="buy"><i class="fa fa-cart-plus"></i> Mua ngay</a>
                                                                                        <a href="javascript:AlertIt();" class="like"><i class="fa fa-heart"></i> Yêu thích</a>
                                                                                        <div class="clear"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="info-product " style="width: 180px; height: 200px">
                                                                                    <h4><a href="${thongtinsanphamUrl}" ><c:out value="${sanpham.tenSanPham}"/></a></h4>
                                                                                    <div class="price">
                                                                                        <span class="price-current"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sanpham.giaSanPham}" /> vnđ</span>
<%--                                                                                        <span class="price-old">990.000₫</span>--%>
                                                                                    </div>
                                                                                    <a href="${thongtinsanphamUrl}" class="view-more">Xem chi tiết</a>

                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>


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

     </div>
                                                                                 </div>
                                                                                 </div>
                                                                                 </div>
                                                                                 </div>
                                                                                 </div>
                                        </body>
    <%--                        footer                    --%>
    <%@ include file="footer.jsp" %>
