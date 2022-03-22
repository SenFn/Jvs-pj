<%-- 
    Document   : checkout
    Created on : May 26, 2021, 7:59:37 PM
    Author     : LENNGUYEN
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">
        <!-- google font web -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
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
                                        <c:url var="homebackUrl" value="/homeback">

                                            <c:param name="giohangId" value="${giohangId}" />
                                            <c:param name="tennguoidung"   value="${tennguoidung}" />  
                                        </c:url>
                                        <li><a href="${homebackUrl}">Cửa hàng</a></li>
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
                                                <li><a href="<%=request.getContextPath()%>/doimatkhau.jsp">Đổi mật khẩu</a></li>
                                            </ul>
                                        </li>

                                        <c:url var="lienhe" value="/lienhe" />   

                                        <li><a href="${lienhe}">Liên hệ</a></li>
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
                                <a <a href="<%=request.getContextPath()%>/index.jsp"><img src="${pageContext.request.contextPath}/resources/images/logo6.png" alt=""></a>
                                <h1>Website bán hàng</h1>
                            </div>
                        </div>
                        <div class="col-12 col-xs-12 col-sm-12 col-md-6 col-lg-6 order-md-1 order-2">
                            <div class="form-seach-product">
                                <form action="/" method="GET" role="form">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Chọn danh mục</option>
                                        <option value="1">Máy Tính Bàn</option>
                                        <option value="2">MacBook</option>
                                        <option value="3">Lap top</option>
                                        <option value="4">Phụ kiện</option>
                                    </select>
                                    <div class="input-seach">
                                        <input type="text" placeholder="Wifi/router/kích sóng wifi..." name="s" id="" class="form-control">
                                        <button type="submit" class="btn-search-pro"><i class="fa fa-search"> </i></button>
                                    </div>
                                    <div class="clear"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-6 col-xs-6 col-sm-6 col-md-3 col-lg-3 order-md-2 order-1" style="text-align: right">
                            <a href="#" class="icon-cart">
                                <div class="icon" >

                                    <a href="${giohanglistUrl}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                    <!-- class gio hang -->
                                    <span><c:out value="${soluongsanpham}"/></span>
                                </div>
                                <%-------------------------------------------------------------------------- Giỏ hàng ----------------------------------------------------------------------------------------%> 
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
                            <li class="current-menu-item"><a href="<%=request.getContextPath()%>/index.jsp">Trang chủ</a></li>
                            <li><a href="<%=request.getContextPath()%>/gioithieu">Giới thiệu</a></li>
                            <li>
                                <a href="#">Sản phẩm</a>
                                <ul>
                                    <li><a href="#">Máy tính bàn</a></li>
                                    <li><a href="#">Macbook</a></li>
                                    <li><a href="#">Laptop</a></li>
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

        <div class="container">
            <div class="py-5 text-center">

                <h2>THANH TOÁN</h2>
                <p> Nếu bạn có tài khoản vui lòng đăng nhập <a href="${pageContext.request.contextPath}/view/client/login" style="color: #754110">tại đây!</a></p>
            </div>
            <%--------------------------------------------- Bảng thanh toán giỏ hàng --------------------------------------------%>
            <div class="container">
                <form>
                    <div class="table table-horver col-xs-12 col-sm-12 col-md-12">
                        <table class="col-xs-12 col-sm-12 col-md-12">
                            <thead>
                                <tr>
                                    <th style="text-align: center">Xóa</th>
                                    <th style="text-align: center">Mã Sản Phẩm</th>
                                    <th style="text-align: center">Ảnh</th>
                                    <th style="text-align: center">Tên Sản Phẩm</th>
                                    <th style="text-align: center">Số Lượng</th>
                                    <th style="text-align: center">Giá</th>
                                    <th style="text-align: center" >Thanh Toán</th>

                                </tr>


                            </thead>

                            <tbody>

                                <c:if test="${! empty giohangs.sanPhamTrongGioHangs}">                                  
                                    <c:forEach items="${giohangs.sanPhamTrongGioHangs}" var="sanPhamTrongGioHang">
                                        <tr style="text-align: center"> 
                                            <c:url var="xoaUrl" value="/thanhtoan/deleteSanPhamTrongGio">
                                                <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>

                                                <c:param name="giohangId" value="${giohangId}"/>
                                            </c:url>
                                            <td style="text-align: center"><a class="btn-remove" href="${xoaUrl}"><span class="fa fa-trash-o"></span></a></td>
                                            <td style="text-align: center">
                                                <c:out value="${sanPhamTrongGioHang.masp}"></c:out>
                                                </td>
                                                <td>
                                                    <img  src="data:image/png;base64,${sanPhamTrongGioHang.imggh}" style="width: 60px; height: 60px"/>
                                                </td>
                                                <td style="text-align: center">
                                                    <a href="#"> <c:out value="${sanPhamTrongGioHang.tenSanPham}"></c:out></a>

                                                </td>
                                                <td style="text-align: center">

                                                <c:url var="congUrl" value="/thanhtoan/congsoluong">
                                                    <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>
                                                    <c:param name="soluong"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                    <c:param name="giohangId" value="${giohangId}"/>
                                                    <c:param name="soluongsp"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                       <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                </c:url>
                                                <c:url var="truUrl" value="/thanhtoan/trusoluong">
                                                    <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>
                                                    <c:param name="soluong"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                    <c:param name="giohangId" value="${giohangId}"/>
                                                    <c:param name="soluongsp"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                       <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                </c:url>
                                                <span>
                                                    <c:if test="${sanPhamTrongGioHang.soLuong != 1}">
                                                        <button onclick="window.location.href = '${truUrl}';" class="btn" type="button">-</button>
                                                    </c:if>
                                                </span>
                                                <input style="text-align: center" size="10" type="text" value="${sanPhamTrongGioHang.soLuong}" disabled/>
                                                <span>

                                                    <button onclick="window.location.href = '${congUrl}';" class="btn" type="button">+</button>

                                                </span>

                                            </td>

                                            <td style="text-align: center"> <span style="color : #ff0000" id="giaid"> <c:out value="${sanPhamTrongGioHang.giaSanPham}"></c:out></span>  </td>
                                            <td style="text-align: center">${sanPhamTrongGioHang.soLuong * sanPhamTrongGioHang.giaSanPham}<span id="tongtienid" style="color : #ff0000"></span>  </td>
                                        </tr>
                                        <c:url var="savekhachhangUrl" value="/thanhtoan/saveKhachHangChuaDangNhap">
                                            <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>
                                            <c:param name="giohangId" value="${giohangId}"/>
                                            <c:param name="soluongsp"  value="${sanPhamTrongGioHang.soLuong}"/>
                                            <c:param name="khachhangId" value="${khachhangId}"/>
                                            <c:param name="hoadonId" value="${hoadonId}"/>
                                            <c:param name="tennguoidung"   value="${tennguoidung}" />
                                        </c:url>
                                        <c:url var="savekhachhangCoDangNhapUrl" value="/thanhtoan/saveKhachHangCoDangNhap">
                                            <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>
                                            <c:param name="giohangId" value="${giohangId}"/>
                                            <c:param name="soluongsp"  value="${sanPhamTrongGioHang.soLuong}"/>
                                            <c:param name="khachhangId" value="${khachhangId}"/>
                                            <c:param name="hoadonId" value="${hoadonId}"/>
                                            <c:param name="tennguoidung"   value="${tennguoidung}" />
                                        </c:url>  
                                    </c:forEach>
                                </c:if>

                            <div> 
                                <%------------------------ Tổng tiền ở đây  ------------------------------%> 
                                <th>Tổng tiền: </th>
                                <td> <strong style="color : #ff0000"> <c:out value="${tonggia}"></c:out> vnđ</strong>  </td>

                                <%------------------------ ----------------------------------------------------%>
                            </div>

                            <c:if test="${empty giohangs.sanPhamTrongGioHangs}">
                                <h3>Giỏ hàng trống</h3>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>

            <div class="container text-center" style="text-align: center">



                <h4 class="mb-3"> Thông tin khách hàng</h4>
                <c:if test="${tennguoidung == '0'}">
                    <!-- ------------------------------------------------------javascripsubmit-------------------------------------------------------------------------------- -->
                    <script>
                        submitForms = function () {
                            alert("Đơn Hàng đã được xử lí  Thành Công ! Chúc bạn 1 ngày vui vẻ ");
                            document.getElementById("form1").submit();

                        }
                    </script>

                    <%----------------------------------------------------- Bảng địa chỉ giao hàng -----------------------------------------------------%>
                    <form:form class="needs-validation "  id="form1" modelAttribute="khachhang" method="POST" action="${savekhachhangUrl}" >
                        <form  >
                            <div class="row " >
                                <div class="col-md-12 ">
                                    <form:input type="text" class="form-control" path="tenKhachHang"  placeholder="Tên khách hàng*"/>
                                    <div class="invalid-feedback">
                                        Tên hợp lệ !
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <br>
                                    <form:input type="email" class="form-control" path="email" placeholder="Email*" />

                                </div>

                                <div class="col-md-6 mb-3">
                                    <br>
                                    <form:input type="tel" class="form-control" path="soDienThoaikh" placeholder="Số điện thoại*" />

                                </div>

                            </div>


                            <form:form   modelAttribute="hoadon" method="POST" >
                                <%
                                    Date date = Date.valueOf(LocalDate.now());
                                %>

                                <form:hidden path="ngayMua" name="ngayMua" value="<%= date%>" />
                                <form:hidden path="tongGiaTien" name="tongGiaTien" value="${tonggia}" />

                                <hr class="mb-4">

                                <h6 class="mb-3">Chọn Hình thức thanh toán</h6>

                                <div class="d-block my-3">
                                    <div class="custom-control custom-radio">
                                        <form:select class="custom-select d-block w-100" path="hinhThucThanhToan">
                                            <form:option  selected="selected" value="Thanh toán khi nhận hàng (COD)">Thanh toán khi nhận hàng (COD)</form:option>
                                            <form:option value="Thanh toán bằng thể ngân hàng (ATM)">Thanh toán bằng thể ngân hàng (ATM)</form:option>
                                        </form:select>                          
                                    </div>

                                </div>

                                <hr class="mb-4">



                                <form:form class="needs-validation "  id="form3" modelAttribute="giaohang" method="POST"  >
                                    <%-- Địa chỉ giao hàng --%>

                                    <hr class="mb-4">
                                    <div class="mb-3">

                                        <form:input type="text" class="form-control" path="diaChiGiaoHang" placeholder="Địa chỉ*"/>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5 mb-3">

                                            <select class="custom-select d-block w-100"  id="country" required>
                                                <option value="">Tỉnh / Thành phố</option>
                                                <option> An Giang </option>
                                                <option>Bà Rịa - Vũng Tàu</option>
                                                <option> Bắc Giang</option>
                                                <option> Bắc Kạn </option>
                                                <option> Bắc Ninh </option> 
                                                <option> Bắc Giang </option> 
                                                <option> Bắc Kạn </option> 
                                                <option> Bạc Liêu </option> 
                                                <option> Bến Tre </option> 
                                                <option> Bình Định </option> 
                                                <option> Bình Dương </option> 
                                                <option> Bình Phước</option> 
                                                <option> Bình Thuận </option> 
                                                <option> Cà Mau </option> 
                                                <option> Cần Thơ </option> 
                                                <option> Cao Bằng </option> 
                                                <option> Đà Nẵng </option> 
                                                <option> Đắk Lắk </option> 
                                                <option> Đắk Nông </option> 
                                                <option> Điện Biên </option>  
                                                <option> Đồng Nai </option> 
                                                <option> Đồng Tháp </option> 
                                                <option> Gia Lai </option> 
                                                <option> Hà Giang </option> 
                                                <option> Hà Nam </option> 
                                                <option> Hà Nội</option> 
                                                <option> Hà Tĩnh </option> 
                                                <option> Hải Dương </option> 
                                                <option> Hải Phòng </option> 
                                                <option> Hậu Giang </option> 
                                                <option> Hòa Bình </option> 
                                                <option> Hưng Yên </option> 
                                                <option> Khánh Hòa </option> 
                                                <option> Kiên Giang </option> 
                                                <option> Kon Tum </option> 
                                                <option> Lai Châu </option> 
                                                <option> Lâm Đồng </option> 
                                                <option> Lạng Sơn </option> 
                                                <option> Lào Cai </option> 
                                                <option> Long An </option> 
                                                <option> Nam Định </option> 
                                                <option> Nghệ An </option> 
                                                <option> Ninh Bình </option> 
                                                <option> Ninh Thuận </option> 
                                                <option> Phú Thọ </option> 
                                                <option> Phú Yên </option> 
                                                <option> Quảng Bình </option> 
                                                <option> Quảng Nam </option> 
                                                <option> Quảng Ngãi </option> 
                                                <option> Quảng Ninh </option> 
                                                <option> Quảng Trị </option> 
                                                <option> Sóc Trăng</option>  
                                                <option> Sơn La </option> 
                                                <option> Tây Ninh </option> 
                                                <option> Thái Bình </option> 
                                                <option> Thái Nguyên </option> 
                                                <option> Thanh Hóa </option> 
                                                <option> Thừa Thiên Huế </option> 
                                                <option> Tiền Giang </option> 
                                                <option> Thành phố Hồ Chí Minh </option> 
                                                <option> Trà Vinh </option> 
                                                <option> Tuyên Quang </option> 
                                                <option> Vĩnh Long </option> 
                                                <option> Vĩnh Phúc </option> 
                                                <option> Yên Bái </option> 
                                            </select>

                                        </div>
                                        <div class="col-md-5 mb-3">                              
                                            <form:select class="custom-select d-block w-100" path="congTyShip">
                                                <form:option selected="selected" value=" Viettel Post"> Viettel Post</form:option>
                                                <form:option value="Shopee Express">Shopee Express</form:option>
                                                <form:option value="grab ship">grab ship</form:option>
                                                
                                                <form:option value="Giao Hang Tiet Kiem">Giao Hang Tiet Kiem</form:option>
                                            </form:select>
                                        </div>


                                    </div>
                                </form:form>
                            </form:form>
                        </form:form>
                    </c:if>
                    <c:if test="${tennguoidung != '0'}">
                        <!-- ------------------------------------------------------javascripsubmit-------------------------------------------------------------------------------- -->
                        <script>
                            submitForms = function () {
                                alert("Đơn Hàng đã được xử lí  Thành Công ! Chúc bạn 1 ngày vui vẻ ");
                                document.getElementById("form2").submit();

                            }
                        </script>

                        <%----------------------------------------------------- Bảng địa chỉ giao hàng -----------------------------------------------------%>


                        <div class="row " >
                            <div class="col-md-12 ">
                                <input type="text" class="form-control"  value="${khachhang.tenKhachHang}" disabled/>
                                <div class="invalid-feedback">
                                    Tên hợp lệ !
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <br>
                                <input type="email" class="form-control" value="${khachhang.email}" disabled/>

                            </div>

                            <div class="col-md-6 mb-3">
                                <br>
                                <input type="tel" class="form-control" value="${khachhang.soDienThoaikh}" disabled/>

                            </div>

                        </div>


                                <form:form  id="form2"  modelAttribute="hoadon" method="POST" action="${savekhachhangCoDangNhapUrl}">
                            <%
                                Date date1 = Date.valueOf(LocalDate.now());
                            %>

                            <form:hidden path="ngayMua" name="ngayMua" value="<%= date1%>" />
                            <form:hidden path="tongGiaTien" name="tongGiaTien" value="${tonggia}" />

                            <hr class="mb-4">

                            <h6 class="mb-3">Chọn Hình thức thanh toán</h6>

                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <form:select class="custom-select d-block w-100" path="hinhThucThanhToan">
                                        <form:option  selected="selected" value="Thanh toán khi nhận hàng (COD)">Thanh toán khi nhận hàng (COD)</form:option>
                                        <form:option value="Thanh toán bằng thể ngân hàng (ATM)">Thanh toán bằng thể ngân hàng (ATM)</form:option>
                                    </form:select>                          
                                </div>

                            </div>
                            <hr class="mb-4">



                            <form:form class="needs-validation "  id="form3" modelAttribute="giaohang" method="POST"  >
                                <%-- Địa chỉ giao hàng --%>

                                <hr class="mb-4">
                                <div class="mb-3">

                                    <form:input type="text" class="form-control" path="diaChiGiaoHang" placeholder="Địa chỉ*"/>
                                </div>

                                <div class="row">
                                    <div class="col-md-5 mb-3">

                                        <select class="custom-select d-block w-100"  id="country" required>
                                            <option value="">Tỉnh / Thành phố</option>
                                            <option> An Giang </option>
                                            <option>Bà Rịa - Vũng Tàu</option>
                                            <option> Bắc Giang</option>
                                            <option> Bắc Kạn </option>
                                            <option> Bắc Ninh </option> 
                                            <option> Bắc Giang </option> 
                                            <option> Bắc Kạn </option> 
                                            <option> Bạc Liêu </option> 
                                            <option> Bến Tre </option> 
                                            <option> Bình Định </option> 
                                            <option> Bình Dương </option> 
                                            <option> Bình Phước</option> 
                                            <option> Bình Thuận </option> 
                                            <option> Cà Mau </option> 
                                            <option> Cần Thơ </option> 
                                            <option> Cao Bằng </option> 
                                            <option> Đà Nẵng </option> 
                                            <option> Đắk Lắk </option> 
                                            <option> Đắk Nông </option> 
                                            <option> Điện Biên </option>  
                                            <option> Đồng Nai </option> 
                                            <option> Đồng Tháp </option> 
                                            <option> Gia Lai </option> 
                                            <option> Hà Giang </option> 
                                            <option> Hà Nam </option> 
                                            <option> Hà Nội</option> 
                                            <option> Hà Tĩnh </option> 
                                            <option> Hải Dương </option> 
                                            <option> Hải Phòng </option> 
                                            <option> Hậu Giang </option> 
                                            <option> Hòa Bình </option> 
                                            <option> Hưng Yên </option> 
                                            <option> Khánh Hòa </option> 
                                            <option> Kiên Giang </option> 
                                            <option> Kon Tum </option> 
                                            <option> Lai Châu </option> 
                                            <option> Lâm Đồng </option> 
                                            <option> Lạng Sơn </option> 
                                            <option> Lào Cai </option> 
                                            <option> Long An </option> 
                                            <option> Nam Định </option> 
                                            <option> Nghệ An </option> 
                                            <option> Ninh Bình </option> 
                                            <option> Ninh Thuận </option> 
                                            <option> Phú Thọ </option> 
                                            <option> Phú Yên </option> 
                                            <option> Quảng Bình </option> 
                                            <option> Quảng Nam </option> 
                                            <option> Quảng Ngãi </option> 
                                            <option> Quảng Ninh </option> 
                                            <option> Quảng Trị </option> 
                                            <option> Sóc Trăng</option>  
                                            <option> Sơn La </option> 
                                            <option> Tây Ninh </option> 
                                            <option> Thái Bình </option> 
                                            <option> Thái Nguyên </option> 
                                            <option> Thanh Hóa </option> 
                                            <option> Thừa Thiên Huế </option> 
                                            <option> Tiền Giang </option> 
                                            <option> Thành phố Hồ Chí Minh </option> 
                                            <option> Trà Vinh </option> 
                                            <option> Tuyên Quang </option> 
                                            <option> Vĩnh Long </option> 
                                            <option> Vĩnh Phúc </option> 
                                            <option> Yên Bái </option> 
                                        </select>

                                    </div>


                                    <div class="col-md-5 mb-3">                              
                                          <form:select class="custom-select d-block w-100" path="congTyShip">
                                                <form:option selected="selected" value=" Viettel Post"> Viettel Post</form:option>
                                                <form:option value="Shopee Express">Shopee Express</form:option>
                                                <form:option value="grab ship">grab ship</form:option>
                                                
                                                <form:option value="Giao Hang Tiet Kiem">Giao Hang Tiet Kiem</form:option>
                                            </form:select>
                                    </div>


                                </div>

                            </form:form>
                        </form:form>
                    </c:if>
                    <button class="btn btn-primary btn-lg btn-block" onclick="submitForms()">Thanh toán</button>


            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            <%--------------------------------------------------- Footer ---------------------------------------- --%>
            <%--                        footer                    --%>
            <%@ include file="footer.jsp" %>
            <!-- / Cart view section -->
            <!--  end content-->










    </body>


</html>
