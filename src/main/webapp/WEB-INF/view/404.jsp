<%@page import="com.mycompany.entity.SanPham"%>
<%@page import="com.mycompany.entity.ThongTinSanPham"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
	<title>404 - Error</title>
</head>

<body>
	<h2 style="text-align: center">404 - Page not found</h2>
	<p style="text-align: center">Hmm. We could not find that page.</p>
	<hr>
	<div style="text-align:center">
		<a href="<%=request.getContextPath()%>" style="text-align: center">Back to Home Page</a>
	</div>
</body>

</html>