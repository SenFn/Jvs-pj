<%@page import="com.mycompany.entity.SanPhamTrongGioHang"%>
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
                    <title>Web bán thiết bị mạng</title>
                    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">
                        <!-- google font web -->
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/bootstrap/css/bootstrap.min.css">
                            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/font-awesome/css/font-awesome.min.css">
                                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
                                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
                                        <script>
                                            function dathang() {
                                                alert("Đặt Hàng Thành Công");
                                            }
                                        </script>
                                        </head>
                                        <body>
                                            <div id="wallpaper">
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

                                                    </div>
                                                    <div class="main-menu-header">
                                                        <div class="container">
                                                            <div id="nav-menu">
                                                                <ul>
                                                                    <li class="current-menu-item"><a href="<%=request.getContextPath()%>/index.jsp">Trang chủ</a></li>
                                                                    <li><a href="<%=request.getContextPath()%>/gioithieu.jsp">Giới thiệu</a></li>
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
                                                                    <li><a href="<%=request.getContextPath()%>/lienhe.jsp">Liên hệ</a></li>
                                                                </ul>
                                                                <div class="clear"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </header>
                                                <div class="main">
                                                    <div class="container">
                                                        <div class="row" style="border-bottom : 1px solid #000000">
                                                            <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-9">
                                                                <div class="product-section">
                                                                    <h2 class="title-product">
                                                                        <a href="#" class="title">Giỏ hàng của bạn</a>

                                                                    </h2>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!<!-- --------------------------------------------------------------------------------------------------------- -->
                                                        <div class="container">

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
                                                                                <tr> 
                                                                                    <c:url var="xoaUrl" value="/giohang/deleteSanPhamTrongGio">
                                                                                        <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>
                                                                                        <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                                                        <c:param name="giohangId" value="${giohangId}"/>
                                                                                    </c:url>
                                                                                    <td><a class="btn-remove" href="${xoaUrl}"><span class="fa fa-trash-o"></span></a></td>
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

                                                                                        <c:url var="congUrl" value="/giohang/congsoluong">
                                                                                            <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>
                                                                                            <c:param name="soluong"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                                                            <c:param name="soluongsp"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                                                            <c:param name="giohangId" value="${giohangId}"/>
                                                                                            <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                                                        </c:url>
                                                                                        <c:url var="truUrl" value="/giohang/trusoluong">
                                                                                            <c:param name="sanphamgiohangId" value="${sanPhamTrongGioHang.maspgh}"/>
                                                                                            <c:param name="soluong"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                                                            <c:param name="soluongsp"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                                                            <c:param name="giohangId" value="${giohangId}"/>
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
                                                                                <c:url var="thanhtoanUrl" value="/thanhtoan/showFormForAddThanhToan">
                                                                                    <c:param name="giohangId" value="${giohangId}"/>
                                                                                    <c:param name="soluongsp"  value="${sanPhamTrongGioHang.soLuong}"/>
                                                                                    <c:param name="tennguoidung"   value="${tennguoidung}" />
                                                                                </c:url>
                                                                            </c:forEach>


                                                                        </tbody>
                                                                    </table>
                                                                </div>

                                                            </div>


                                                            <!-- --------------------------------------------------------------------------------------------------------------------------- -->
                                                            <div class="row">

                                                                <div class="container">

                                                                    <div class="form-group">
                                                                        <div class="row">

                                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                                <div class="modal-footer">


                                                                                    <h5 style="text-align: center">Tổng Giá Tiền Phải Thanh Toán:             <span style="color : #ff0000" ><c:out value="${tonggia}"></c:out></span></h5>
                                                                                    <button onclick="window.location.href = '${thanhtoanUrl}';" type="button" id="btndathang" class="btn btn-danger btn-block" >Đặt Hàng</button>
                                                                                </c:if>
                                                                                <c:if test="${empty giohangs.sanPhamTrongGioHangs }">
                                                                                    <h3  style="text-align: center" >Giỏ Hàng Hiện Tại Trống</h3>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <footer>
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                                    <div class="box-footer info-contact">
                                                                        <h3>Thông tin liên hệ</h3>
                                                                        <div class="content-contact">
                                                                            <p>Website chuyên cung cấp thiết bị điện tử hàng đầu Việt Nam</p>
                                                                            <p>
                                                                                <strong>Địa chỉ:</strong> 114 Dương Quảng Hàm ,Phường 5 , Gò Vấp
                                                                            </p>
                                                                            <p>
                                                                                <strong>Email: </strong> locdevid1@gmail.com
                                                                            </p>
                                                                            <p>
                                                                                <strong>Điện thoại: </strong> 0981074xxx
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                                    <div class="box-footer info-contact">
                                                                        <h3>Thông tin khác</h3>
                                                                        <div class="content-list">
                                                                            <ul>
                                                                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Chính sách bảo mật</a></li>
                                                                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Chính sách đổi trả</a></li>
                                                                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Phí vẫn chuyển</a></li>
                                                                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Hướng dẫn thanh toán</a></li>
                                                                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Chương trình khuyến mãi</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                                    <div class="box-footer info-contact">
                                                                        <h3>Form liên hệ</h3>
                                                                        <div class="content-contact">
                                                                            <form action="/" method="GET" role="form">
                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                                        <input type="text" name="" id="" class="form-control" placeholder="Họ và Tên">
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                                                                        <input type="email" name="" id="" class="form-control" placeholder="Địa chỉ mail">
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                                                                        <input type="text" name="" id="" class="form-control" placeholder="Số điện thoại">
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                                        <input type="text" name="" id="" class="form-control" placeholder="Tiêu đề">
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                                        <textarea name="" id="" cols="30" rows="10" class="form-control"></textarea>
                                                                                    </div>
                                                                                </div>
                                                                                <button type="submit" class="btn-contact">Liên hệ ngay</button>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="copyright">
                                                            <p>Copyright © 2020 LOCNGUYEN All Rights Reserved - Design </p>
                                                        </div>
                                                    </footer>
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