<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <title> WELCOME TO PRODUCT MANAGER </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
        <style>
            #ertk, #ermk {
                color: #ff0000;
            }
            input[type=text] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
            }
            input[type=submit] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

        </style>
    </head>

    <body style= "background-image: url(${pageContext.request.contextPath}/resources/images/4853433.jpg)">

        <table style="border: 1px solid; width: 100%; text-align:center">
            <header>
                <div class="top">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <p>
                                    Chào mừng đến với WEBISTE bán hàng wifi
                                </p>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="main-menu-header">

                                    <div id="nav-menu">
                                        <ul>
                                            <li><a href="#">Cửa hàng</a></li>
                                            <li><a href="#" data-toggle="modal" data-target="#btnmodal">Đăng nhập</a></li>
                                            <li>
                                                <a href="#">Tài Khoản</a>
                                                <ul>
                                                    <li><a href="<%=request.getContextPath()%>/dangky">Đăng ký</a></li>
                                                    <li><a href="<%=request.getContextPath()%>/giohang">Giỏ Hàng</a></li>
                                                    <li><a href="<%=request.getContextPath()%>/doimatkhau">Đổi mật khẩu</a></li>
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

                <div class="row mt-3">

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="card-title">Thông tin sản phẩm</h1>
                                <div class="table-responsive">

                                    <c:url var="saveUrl" value="/sanpham/saveSanPham" />


                                    <form  method="POST" action="${pageContext.request.contextPath}/sanpham/saveSanPham?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" id="formSaveProduct">
                                        
                                        <%--
                                       This line is very important. Without this line, we'd actually lose context or we actually lose the id of the
                                       original customer. So we need to use this line to actually track the customer just so the back end system 
                                       knows which customer to form the update operation on. 
                                        --%>
                                        <table>
                                            <tr>
                                                <input type="hidden" name="id" value="${sanpham.masp}"/>
                                                <td><label name="tenSanPham">--Tên sản phẩm:</label></td>
                                                <td><input type="text" name="tenSanPham" value="${sanpham.tenSanPham}"/></td>
                                            </tr>

                                            <tr>

                                                <th>--Hình ảnh: </th>
                                                <td><input type="file" name="file"/></td>
                                            </tr>
                                            <tr>

                                                <td><label  name="loaiSanPham">--Loại sản phầm</label></td>
                                                <td  style="width: 91%"><input type="text" name="loaiSanPham" value="${sanpham.loaiSanPham}"/></td>

                                            </tr>
                                            <tr>

                                                <td><label name="giaSanPham">--Giá: </label></td>
                                                <td><input type="text"  name="giaSanPham" value="${sanpham.giaSanPham}"/></td>
                                            </tr>
                                            <tr>

                                                <td><label name="trangThai">--Trạng thái: </label></td>
                                                <td><input type="number" name="trangThai" min="0" max="1" value="${sanpham.trangThai}"/></td>
                                            </tr>

                                            <tr>

                                                <td><label name="soLuongTrongKho">--Hàng Trong Kho: </label></td>
                                                <td><input type="number" name="soLuongTrongKho"  min="1" max="100" value="${sanpham.soLuongTrongKho}" /></td>
                                            </tr>

                                            <tr>

                                                <td><label name="nhaCungCap">--Nhà cung cấp: </label></td>
                                                <td><input type="text" name="nhaCungCap"  min="1" max="100" value="${sanpham.thongTinSanPhams.nhaCungCap}" /></td>
                                            </tr>

                                            <tr>

                                                <td><label name="moTa">--Mô Tả: </label></td>
                                                <td><textarea rows="4" cols="50" name="mota" form="formSaveProduct">${sanpham.thongTinSanPhams.moTa}</textarea></td>
                                            </tr>

                                            <tr>

                                                <td><label name="baoHanh">--Bảo Hành: </label></td>
                                                <td><input type="text" name="baohanh"  min="1" max="100" value="${sanpham.thongTinSanPhams.baoHanh}" /></td>
                                            </tr>
                                        </table>

                                        <input  type="submit" value="Save" />
                                    </form>
                                    </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlay toggle-menu"></div>





            </body>
            </html>