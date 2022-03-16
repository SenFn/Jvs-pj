<%-- 
    Document   : giaohang-list
    Created on : May 27, 2021, 8:51:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



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
                        <div class="card">
                            <div class="card-body">
                                <h1 class="card-title">Thông tin sản phẩm</h1>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="text-align: center">Mã thông tin</th>
                                                <th scope="col" style="text-align: center">Tên sản phẩm</th>
                                                <th scope="col" style="text-align: center">Hình ảnh</th>
                                                 <th scope="col" style="text-align: center">Giá sản phẩm</th>
                                                <th scope="col" style="text-align: center">Nhà cung cấp</th>
                                                <th scope="col" style="text-align: center">Mô tả</th>
                                                <th scope="col" style="text-align: center">Bảo hành</th>
                                                <th scope="col">Sửa</th>
                                                <th scope="col">Xóa</th>


                                            </tr>
                                        </thead>
                                         <tbody style="background:#ccc">
                                      
                                            <c:if test="${!empty thongtinsanphams}">
                                               
                                                    <tr>
                                                        <td><c:out value="${thongtinsanphams.matt}" /></td>
                                                        <td><c:out value="${thongtinsanphams.tenSanPham}" /></td>
                                                        <td><img style="    width: 110px;height: 67px; object-fit: cover;border: 1px solid #fff;" src="data:image/png;base64,${thongtinsanphams.imgtt}"></td>
                                                        <td><c:out value="${thongtinsanphams.giaSanPham}" /></td>
                                                        <td><c:out value="${thongtinsanphams.nhaCungCap}" /></td>
                                                        <td><c:out value="${thongtinsanphams.moTa}" /></td>
                                                        <td><c:out value="${thongtinsanphams.baoHanh}" /></td>
                                                        <%--<c:url var="addCcUrl" value="/creditcard/add?personId=${person.id}" />--%>

                                                    <td  style="text-align: center" >
                                                    <a href="${editUrl}"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i> </a>

                                                </td>
                                                        
                                                        <td><a href="${deleteUrl}"><i class="fa fa-trash fa-2x"></i></a></td>
                                                        
                                             </tr>
                                               
                                            </c:if>
                                              <c:if test="${!empty thongtinsanphams}">
                                                
                                                   
                                            </c:if>
                                          
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

                </body>
                </html>
