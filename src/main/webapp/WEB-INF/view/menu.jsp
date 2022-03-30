<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div id="nav-menu">
        <ul>
                <li class="current-menu-item"><a href="<%=request.getContextPath()%>/index">Trang chủ</a></li>
<%--                <li><a href="<%=request.getContextPath()%>/gioithieu">Giới thiệu</a></li>--%>
                <li>
                        <a href="<%=request.getContextPath()%>/sanpham?type=all">Sản phẩm</a>
                        <ul>
                                <li><a href="<%=request.getContextPath()%>/sanpham?type=router">Router</a></li>
                                <li><a href="<%=request.getContextPath()%>/sanpham?type=hub">Hub mạng</a></li>
                                <li><a href="<%=request.getContextPath()%>/sanpham?type=other">Sản phẩm khác</a></li>
                        </ul>
                </li>
                <li><a href="#">Tin tức</a></li>
                <li><a href="#">Tuyển dụng</a></li>
                <li><a href="<%=request.getContextPath()%>/lienhe">Liên hệ</a></li>
        </ul>
        <div class="clear"></div>
</div>