<%-- 
    Document   : chitietsanpham
    Created on : May 20, 2021, 2:58:59 PM
    Author     : LENNGUYEN
--%>
<%@page import="com.mycompany.entity.SanPhamTrongGioHang"%>
<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="com.mycompany.entity.SanPham"%>
<%@page import="com.mycompany.entity.ThongTinSanPham"%>
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

                                            <%
                                                ThongTinSanPham thongTinSanPham = (ThongTinSanPham) request.getAttribute("thongtinsanphams");
                                                //ThongTinSanPham thongTinSanPham = sanPham.getThongTinSanPhams();
                                                // String masp = thongTinSanPham.get
                                                String tensp = thongTinSanPham.getTenSanPham();
                                                String img = thongTinSanPham.getImgtt();
                                                double giadb = thongTinSanPham.getGiaSanPham();
                                                String gia = String.valueOf(thongTinSanPham.getGiaSanPham());
                                                String nhacungcap = thongTinSanPham.getNhaCungCap();
                                                String mota = thongTinSanPham.getMoTa();
                                                String baohanh = thongTinSanPham.getBaoHanh();
                                                int soluong = 1;
                                                String maghh = request.getParameter("giohangId");
                                                int giohangId = Integer.parseInt(maghh);
                                                String ma = request.getParameter("sanphamId");
                                                int masp = Integer.parseInt(ma);
//                                                SendData senddata= new SendData();
//                                                senddata.setImg64(img);
//                                                SanPhamTrongGioHang  sanpham = new SanPhamTrongGioHang();
//                                                sanpham.setImggh(img);
                                               // session.setAttribute("img", sanpham);
//                                                byte[] decodedByte = Base64.decode(img);
//                                                 Blob imgb = new SerialBlob(decodedByte); 
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
                                                                                    <c:url var="giohanglistUrl" value="/giohang/list" >   
                                                                                        <c:param name="giohangId" value="${giohangId}" />
                                                                                        <c:param name="soluongsp" value="${soluongsanpham}" />
                                                                                        <c:param name="tennguoidung"   value="${tennguoidung}" />  
                                                                                    </c:url>
                                                                                    <li><a href="${pageContext.request.contextPath}/register/showRegistrationForm">Đăng ký</a></li>
                                                                                    <li><a href="${giohanglistUrl}">Giỏ Hàng</a></li>
                                                                                    <li><a href="#">Đổi mật khẩu</a></li>
                                                                                </ul>
                                                                            </li>
                                                                            <li><a href="<%=request.getContextPath()%>/lienhe">Liên hệ</a></li>
                                                                        </ul>
                                                                        <div class="clear"></div>
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
                                                                            <a <a href="<%=request.getContextPath()%>/index"><img src="${pageContext.request.contextPath}/resources/images/logo6.png" alt=""></a>
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
                                                        <div class="card">
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
                                                                        <small class="text-muted">Giá cũ: <s><span>1,800,000 vnđ</span></s></small>
                                                                        <h4 class="price">Giá hiện tại: <span><%=gia%> vnđ</span></h4>
                                                                        <p class="vote"><strong>100%</strong> hàng <strong>Chất lượng</strong>, đảm bảo
                                                                            <strong>Uy tín</strong>!</p>
                                                                        <div class="action">
                                                                           
                                                                            <c:url var="saveUrl" value="/giohang/saveSanPhamGioHang" >   
                                                                                <c:param name="giohangId" value="${giohangId}" />
                                                                                <c:param name="sanphamId" value="<%= ma%>" />
                                                                                <c:param name="soluongsanpham"   value="${soluongsanpham}" />
                                                                                <c:param name="tennguoidung"   value="${tennguoidung}" />  
                                                                                  <c:param name="img"   value="<%=img%>" /> 
                                                                            </c:url>

                                                                            <%
                                                                                String onclickRequest = request.getParameter("onclick");

                                                                                session.setAttribute("onclicks", onclickRequest);

                                                                            %>

                                                                            <c:if test = "${onclicks == 'index'}">
                                                                                <form:form modelAttribute="sanphamtronggiohang" method="POST" action="${saveUrl}">

                                                                                    <form:hidden path="masp" name="masp" value="<%=masp%>" />
                                                                                    <form:hidden path="tenSanPham" name="tenSanPham" value="<%=tensp%>" />
                                                                                    
                                                                                    <form:hidden path="giaSanPham" name="giaSanPham" value="<%=giadb%>" />
                                                                                    <form:hidden path="soLuong" name="soLuong" value="<%=soluong%>" />
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

                                                        <div class="card"></div>
                                                        <div class="card">
                                                            <div class="container-fluid">
                                                                <h3>Thông tin chi tiết về sản phẩm</h3>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <strong>Antenna Thiết kế sáng tạo</strong>
                                                                        <br>
                                                                            <%=mota%>

                                                                            <br>   
                                                                                UniFi AC LR AP Thiết kế với hiệu suất RF tối ưu

                                                                                <br>
                                                                                    UniFi AC LR AP Hệ thống quản lý Wi-Fi chuyên nghiệp
                                                                                    <br>
                                                                                        The UniFi Controller v4 software is a powerful, enterprise wireless software engine ideal for high-density client deployments requiring low latency and high uptime performance. With its software-based capabilities, the UniFi virtual control plane allows for unlimited scalability under one centralized controller. Remotely access the UniFi Controller to upgrade deployed UniFi APs while in the field.
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
                                                                                        <footer>
                                                                                            <div class="container">
                                                                                                <div class="row">
                                                                                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                                                                        <div class="box-footer info-contact">
                                                                                                            <h3>Thông tin liên hệ</h3>
                                                                                                            <div class="content-contact">
                                                                                                                <p>Website chuyên cung cấp thiết bị mạng hàng đầu Việt Nam</p>
                                                                                                                <p>
                                                                                                                    <strong>Địa chỉ:</strong> 12 Nguyễn Văn Bảo Phường 4 gò Vấp
                                                                                                                </p>
                                                                                                                <p>
                                                                                                                    <strong>Email: </strong> maihuytech@gmail.com
                                                                                                                </p>
                                                                                                                <p>
                                                                                                                    <strong>Điện thoại: </strong> 091234xxx
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

                                                                                        </footer>
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
