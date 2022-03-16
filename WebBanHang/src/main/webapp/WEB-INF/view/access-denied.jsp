<%@page import="com.mycompany.entity.SanPham"%>
<%@page import="com.mycompany.entity.ThongTinSanPham"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
	<title>luv2code - Access Denied</title>
</head>

<body>

	<h2>Access Denied - You are not authorized to access this resource.</h2>
	<hr>
        <c:url var="comeHome" value="/homeUser" >
            <c:param name="tendangnhap" value="${tendangnhap}"/>
        </c:url>
	<a href="${comeHome}">Back to Home Page</a>
	
</body>

</html>