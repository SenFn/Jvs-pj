<%-- 
    Document   : sanpham-list
    Created on : May 21, 2021, 10:35:51 AM
    Author     : LENNGUYEN
--%>

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
        </style>
    </head>

    <body style= "background-image: url(${pageContext.request.contextPath}/resources/images/4853433.jpg)">

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
                                        <li><a href="#" data-toggle="modal" data-target="#btnmodal">Đăng nhập</a></li>
                                        <li>
                                            <a href="#">Tài Khoản</a>
                                            <ul>
                                                <li><a href="<%=request.getContextPath()%>/dangky">Đăng ký</a></li>
                                                <li><a href="<%=request.getContextPath()%>/giohang.jsp">Giỏ Hàng</a></li>
                                                <li><a href="<%=request.getContextPath()%>/doimatkhau.jsp">Đổi mật khẩu</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="<%=request.getContextPath()%>/lienhe.jsp">Liên hệ</a></li>
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
                    <button class="add-catalog"><a href="${pageContext.request.contextPath}/sanpham/showFormForAdd">Thêm sản phẩm</a></button>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Danh sách sản phẩm</h5>
                            <div class="table-responsive">

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center" scope="col">Mã Sản Phẩm</th>
                                            <th style="text-align: center" scope="col">Tên sản phẩm</th>
                                            <th style="text-align: center" scope="col">Hình ảnh</th>
                                            <th style="text-align: center" scope="col">Loại Sản Phẩm</th>
                                            <th style="text-align: center" scope="col">Giá</th>
                                            <th style="text-align: center" scope="col">Trạng Thái</th>
                                            <th style="text-align: center" scope="col">Hàng Trong kho</th>
                                            <th  style="text-align: center" scope="col">Sửa</th>
                                            <th  style="text-align: center" scope="col">Xóa</th>
                                            <th  style="text-align: center" scope="col">Chi tiết sản phẩm</th>                                           

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- LẤY THÔNG TIN SẢN PHẨM LÊN TABLE -->
                                        <c:forEach items="${sanphams}" var="sanpham">
                                            <tr>
                                                <th  style="text-align: center"  scope="row">${sanpham.masp}</th>
                                                <td  style="text-align: center" >${sanpham.tenSanPham}</td>
                                                <td><img style="    width: 110px;height: 67px; object-fit: cover;border: 1px solid #fff;" src="data:image/png;base64,${sanpham.imgSp}" alt="${sanpham.tenSanPham}"></td>
                                                <td  style="text-align: center" >${sanpham.loaiSanPham}</td>
                                                <td  style="text-align: center" >${sanpham.giaSanPham}</td>
                                                <td  style="text-align: center" >

                                                    <c:url var="xoaUrl" value="/sanpham/delete">
                                                        <c:param name="sanphamId" value="${sanpham.masp}" />
                                                    </c:url>

                                                    <c:url var="editUrl" value="/sanpham/showFormForUpdate">
                                                        <c:param name="sanphamId" value="${sanpham.masp}" />
                                                    </c:url>

                                                    <c:url var="viewUrl" value="/thongtinsanpham/thongtinlist">
                                                        <c:param name="sanphamId" value="${sanpham.masp}" />
                                                    </c:url>

                                                    <c:choose>
                                                        <c:when test="${sanpham.trangThai == 1}"> 
                                                            <c:out value="Còn hàng"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Hết hàng"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td  style="text-align: center" >${sanpham.soLuongTrongKho}</td>

                                                <td  style="text-align: center" >
                                                    <a href="${editUrl}"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i> </a>

                                                </td>
                                                <td  style="text-align: center" >
                                                    <a href="${xoaUrl}"><i class="fa fa-trash fa-2x"></i></a>
                                                </td>
                                               <td style="text-align: center">
                                            <a href="${viewUrl}"><i class="fa fa-info fa-2x" aria-hidden="true" ></i></a>
                                        </td>
                                            </tr>
                                       
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlay toggle-menu"></div>





    </body>
</html>
