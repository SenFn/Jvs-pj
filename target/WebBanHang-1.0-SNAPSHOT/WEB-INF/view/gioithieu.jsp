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
                                Welcome to the world of PC/Laptop
                            </p>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="main-menu-header">

                                <div id="nav-menu">
                                    <ul>
                                        <li><a href="#">Cửa hàng</a></li>
                                        <li><a href="#">Đăng nhập</a></li>
                                        <li>
                                            <a href="#">Tài Khoản</a>
                                            <ul>
                                                <li><a href="dangky.html">Đăng ký</a></li>
                                                <li><a href="doimk.html">Đổi mật khẩu</a></li>
                                                <li><a href="giohang.html">Giỏ Hàng</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Liên hệ</a></li>
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
                                <a href="index.html"><img src="images/logo.png" alt=""></a>
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
                                        <input type="text" placeholder="Máy bàn / LapTop/MacBook..." name="s" id="" class="form-control">
                                        <button type="submit" class="btn-search-pro"><i class="fa fa-search"> </i></button>
                                    </div>
                                    <div class="clear"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-6 col-xs-6 col-sm-6 col-md-3 col-lg-3 order-md-2 order-1" style="text-align: right">
                            <a href="#" class="icon-cart">
                                <div class="icon">
                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                    <!-- class gio hang -->
                                    <span>2</span>
                                </div>
                                <div class="info-cart">
                                    <p>Giỏ hàng</p>
                                    <span>22.500.000đ</span>
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
                            <li class="current-menu-item"><a href="index.html">Trang chủ</a></li>
                            <li><a href="#">Giới thiệu</a></li>
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
                            <li><a href="#">Liên hệ</a></li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </header>
        <div id="content">
            <div class="container">
                <div class="content-product-box">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <h1 style="border-bottom : 1px solid #000000">Laptop Dell Vostro 3590 V5I3101W</h1>
                        </div>

                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                                <div class="container">
                                    <div class="slider">
                                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <!-- item start -->
                                                    <img class="d-block w-100" src="images/gt.png" alt="first slide">
                                                    <!-- Width =100% -->
                                                </div>
                                                <div class="carousel-item">
                                                    <img class="img-reponsive" src="images/gt1.png" alt="second slide">
                                                </div>
                                                <div class="carousel-item">
                                                    <!-- slide img -->
                                                    <img class="d-block w-100" src="images/gt2.png" alt="three slide">
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
                                    <img src="images/gtmaytinh.png" />
                                        LCD: 15.6" FHD, CPU: Core i3-10110U<br />
                                        RAM: 4 GB/  SSD: 256GB<br />
                                        VGA:  Intel UHD Graphics<br />
                                        HĐH: Win 10<br />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"style="border : 1px solid #808080">
                                <div class="container" >
                                    <div class="item-product">
                                        <div class="info-product">
                                            <div class="price">
                                                <span class="price-current"> Giá :20.990.000₫</span>
                                                <span class="price-old">22.990.000₫</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span>Model: V5I3101W - </span>
                                        <span>Mã hàng:603380</span>
                                        <br />
                                        <span>Bảo hành: 12 tháng</span>
                                        <br />
                                        <span style=" color :#ff0000"><b>Còn Hàng</b></span>
                                        <div style="border :2px solid #ff0000">
                                            <h3 style="border-bottom :2px solid #ff0000 "><span style="color :#ff0000">KHUYẾN MẠI</span></h3>
                                            <ul>
                                                <li><i class="fa fa-angle-right"></i>Tặng chuột không dây hoặc túi đựng máy</li>
                                                <li><i class="fa fa-angle-right"></i>Tặng gói giao hàng+ cài đặt miễn phí trị giá 150.000đ</li>
                                                <li><i class="fa fa-angle-right"></i>Giảm giá trực tiếp 600.000 đ khi mua phần mềm Office bản quyền kèm Laptop</li>
                                                <li><i class="fa fa-angle-right"></i>GIẢM 20% GIÁ PHẦN MỀM DIỆT VIRUS BKAV/KASPERSKY KHI MUA KÈM LAPTOP/PC.</li>
                                                <li><i class="fa fa-angle-right"></i>Tặng 01 suất <span style="color:#FF1493">Giảm thêm 10%</span> mua Loa kéo, Phụ kiện công nghệ (Từ 10/06-31/08/2020). Chi tiết xem <a href="#">tại đây</a></li>
                                            </ul>
                                        </div>

                                    </div>
                                    <img src="images/gh.png" />
                                    <div class="contact-order">
                                        <span>Mua hàng Online:</span> <a href="#"> 0981074 ***</a> (8:00-21:30)
                                    </div>
                                    <a href="#"><strong>MUANGAY</strong>Giao hàng tận nơi</a>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <a href="muangay.html">  <img src="images/muangay.png" /></a>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <a href="#"><img src="images/tragop.png" /></a>

                                        </div>
                                    </div>
                                    <img src="images/httragop.png" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <div>
                                    <span style="color : #280a9a"><strong>Đến siêu thị xem mẫu</strong></span><br />

                                    <select>
                                        <option>Chọn Tỉnh / Thành Phố</option>
                                        <option>Hồ Chí Minh</option>
                                        <option>Hà Nội</option>
                                        <option>Đà Nẵng</option>
                                        <option>Cần Thơ</option>
                                        <option>Nha Trang</option>
                                        <option>...</option>
                                    </select>
                                    <br />
                                    <select>
                                        <option>Chọn Quận / Huyện</option>
                                        <option>Quận 1</option>
                                        <option>Quận Gò Vấp</option>
                                        <option>Quận 3</option>
                                        <option>Huyện Sơn Hà</option>
                                        <option>Huyện Thanh Long</option>
                                        <option>...</option>
                                    </select>
                                    <br />
                                    <br />
                                </div>
                                <div>
                                    <span style="color : #280a9a"><strong>Siêu thị có hàng mẫu</strong></span><br />
                                    - Số 126 Đường Tam Trinh, Phường Yên Sở, Quận Hoàng Mai, Hà Nội <a href="#"><span style="color : #280a9a">Có hàng </span></a><br />
                                    - Số 224 đường Tây Sơn, Thị trấn Phùng, Huyện Đan Phượng, Hà Nội. (Cạnh Bến xe Thị trấn Phùng)<a href="#"><span style="color : #280a9a">Có hàng </span></a><br />
                                    - 517 đường Hạ Long, Bãi Cháy, Quảng Ninh (Đường Cái Dăm cũ)<a href="#"><span style="color : #280a9a">Có hàng </span></a><br />
                                    - 113 Đường Đông A - Khu Đô Thị mới Hòa Vượng - TP Hồ Chí Minh<a href="#"><span style="color : #280a9a">Có hàng </span></a><br />
                                    - số 2 Đường Lê Lợi - phường 10 - Gò Vấp - TP Hồ Chí Minh <a href="#"><span style="color : #280a9a">Có hàng </span></a><br />
                                    - 114 Đường Dường Quảng Hàm - Phường 5 - Gò Vấp - TP Hồ Chí Minh <a href="#"><span style="color : #280a9a">Có hàng </span></a><br />
                                    - 571/14 Đường Âu Cơ - Phường 10 - Quận Tân Bình - TP Hồ Chí Minh <a href="#"><span style="color : #280a9a">Có hàng </span></a><br />
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
