<%@page import="com.mycompany.entity.SanPhamTrongGioHang"%>
<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="com.mycompany.entity.SanPham"%>
<%@page import="com.mycompany.entity.ThongTinSanPham"%>
<%@ page import="com.mycompany.service.DumpService" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
        <head>
        <script type="text/javascript">

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

                                            <%
                                                ThongTinSanPham thongTinSanPham = (ThongTinSanPham) request.getAttribute("thongtinsanphams");
                                                String tensp = thongTinSanPham.getTenSanPham();
                                                String img = thongTinSanPham.getImgtt();

                                                String pattern = "###,###.###";
                                                DecimalFormat decimalFormat = new DecimalFormat(pattern);
                                                String gia = decimalFormat.format(thongTinSanPham.getGiaSanPham()).replace(",",".");

                                                String nhacungcap = thongTinSanPham.getNhaCungCap();
                                                String mota = thongTinSanPham.getMoTa();
                                                String baohanh = thongTinSanPham.getBaoHanh();
                                                int soluong = 1;
                                                String ma = request.getParameter("sanphamId");
                                                int masp = Integer.parseInt(ma);
//                                                SanPhamTrongGioHang  sanpham = new SanPhamTrongGioHang();
//                                                sanpham.setImggh(img);

                                            %>

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
                                                    </div>
                                                </div>
                                                <!-- end header -->

                                                <main role="main">
                                                    <!-- Block content - Đục lỗ trên giao diện bố cục chung, đặt tên là `content` -->
                                                    <div class="container mt-4">
                                                        <div id="thongbao" class="alert alert-danger d-none face" role="alert">
                                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                <span aria-hidden="true">×</span>
                                                            </button>
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
                                                        <div class="card" style="width: 50%;  margin:0 auto;">
                                                            <div class="container-fliud">
                                                                <!---------------------------------------------------------------------------------------------------------------------------->

                                                                <!----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                                                                <div class="wrapper row">
                                                                    <div class="preview col-md-6">
                                                                        <div class="preview-pic tab-content">


                                                                            <img  src="data:image/png;base64,<%=img%>" style="width: 400px; height: 300px"/>


                                                                        </div>

                                                                    </div>


                                                                    <div class="details col-md-6">
                                                                        <script type="text/javascript">

            function AlertIt() {
                confirm("Cảm ơn bạn đã yêu thích sản phẩm:<%= request.getParameter("sanphamId")%> <%=tensp%>");

            }

            function AlertIt1() {
                confirm("Thêm sản phẩm: <%=tensp%> vào giỏ hàng thành công");

            }
            function AlertIt2() {
                confirm("Sản phẩm: <%=tensp%> đã nằm trong giỏ hàng");

            }

                                                                </script>


                                                                <h3 class="product-title"><%=tensp%></h3>

                                                                <div class="rating">
                                                                    <div class="stars">
                                                                        <span class="fa fa-star checked"></span>
                                                                        <span class="fa fa-star checked"></span>
                                                                        <span class="fa fa-star checked"></span>
                                                                        <span class="fa fa-star"></span>
                                                                        <span class="fa fa-star"></span>
                                                                    </div>
                                                                    <span class="review-no">999 reviews</span>
                                                                </div>
                                                                <p class="product-description">Nhà Sản Xuất: <%= nhacungcap%>
                                                                    <br>Bảo Hành: <%= baohanh%> </p>
<%--                                                                <small class="text-muted">Giá cũ: <s><span>1,800,000 vnđ</span></s></small>--%>
                                                                <h4 class="price">Giá hiện tại: <span><%=gia%> vnđ</span></h4>
                                                                <p class="vote"><strong>100%</strong> hàng <strong>Chất lượng</strong>, đảm bảo
                                                                    <strong>Uy tín</strong>!</p>
                                                                <div class="action">

                                                                    <c:url var="saveUrl" value="/giohang/saveSanPhamGioHang" >
<%--                                                                                <c:param name="giohangId" value="${giohangId}" />--%>
                                                                        <c:param name="sanphamId" value="<%= ma%>" />
<%--                                                                                <c:param name="soluongsanpham"   value="${soluongsanpham}" />--%>
<%--                                                                                <c:param name="tennguoidung"   value="${tennguoidung}" />  --%>
<%--                                                                                <c:param name="img"   value="<%=img%>" /> --%>
                                                                    </c:url>

                                                                    <%
                                                                        String onclickRequest = (String) request.getAttribute("onclick");
                                                                        session.setAttribute("onclicks", "index");
                                                                    %>

                                                                    <c:if test = "${onclicks == 'index'}">
                                                                        <form:form modelAttribute="sanphamtronggiohang" method="POST" action="${saveUrl}">

<%--                                                                                    <form:hidden path="masp" name="masp" value="<%=masp%>" />--%>
<%--                                                                                    <form:hidden path="tenSanPham" name="tenSanPham" value="<%=tensp%>" />--%>
<%--                                                                                    --%>
<%--                                                                                    <form:hidden path="giaSanPham" name="giaSanPham" value="<%=giadb%>" />--%>
<%--                                                                                    <form:hidden path="soLuong" name="soLuong" value="<%=soluong%>" />--%>
                                                                            <script type="text/javascript">

                                                                                function AlertIt() {
                                                                                    confirm("Cảm ơn bạn đã yêu thích sản phẩm:<%= request.getParameter("sanphamId")%> <%=tensp%>");

                                                                                }

                                                                                function AlertIt1() {
                                                                                    confirm("Thêm sản phẩm: <%=tensp%> vào giỏ hàng thành công");
                                                                                }

                                                                            </script>
                                                                            <button type="submit" class="add-to-cart btn btn-default" onclick="AlertIt1();">Thêm vào giỏ hàng</button>
                                                                            <a href="javascript:AlertIt();"  class="like btn btn-default"><span class="fa fa-heart"></span></a>
                                                                            </form:form>

                                                                    </c:if>
                                                                    <c:if test = "${onclicks == 'click'}">
                                                                        <script type="text/javascript">

                                                                            function AlertIt() {
                                                                                confirm("Cảm ơn bạn đã yêu thích sản phẩm:<%= request.getParameter("sanphamId")%> <%=tensp%>");

                                                                            }


                                                                            function AlertIt2() {
                                                                                confirm("Sản phẩm: <%=tensp%> đã nằm trong giỏ hàng");

                                                                            }

                                                                        </script>
                                                                        <button class="add-to-cart btn btn-default" onclick="AlertIt2();">Thêm vào giỏ hàng</button>
                                                                        <a href="javascript:AlertIt();"  class="like btn btn-default"><span class="fa fa-heart"></span></a>
                                                                        </c:if>



                                                                </div>

                                                            </div>
                                                            <!----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="card" style="width: 50%;  margin:0 auto;">
                                                    <div class="container-fluid">
                                                        <h3>Thông tin chi tiết về sản phẩm</h3>
                                                        <div class="row">
                                                            <div class="col">
                                                                <br>
                                                                    <%=mota%>

                                                                    <br>
                                                                                                                                               <br>
                                                                            </div>
                                                                                </div>
                                                                                </div>
                                                                                </div>
                                                                                </div>
                                                                                <!-- End block content -->
                                                                                </main>

                                                                                <!-- footer -->
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

                                                                                    <script src="${pageContext.request.contextPath}/resources/libs/jquery-3.4.1.min.js"></script>
                                                                                    <script src="libs/bootstrap/js/bootstrap.min.js"></script>
                                                                                    <script src="js/main.js"></script>
                                                                                    <div id="fb-root"></div>
                                                                                    <!-- Optional JavaScript -->
                                                                                    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                                                                                    <script src="${pageContext.request.contextPath}/resources/libs/jquery/jquery.min.js"></script>
                                                                                    <script src="${pageContext.request.contextPath}/resources/libs/popperjs/popper.min.js"></script>
                                                                                    <script src="libs/bootstrap/js/bootstrap.min.js"></script>

                                                                                    <!-- Custom script - Các file js do mình tự viết -->


                                                                                    </body>
                                                                                    </html>
