<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>This is index</h1>
	<a href="/products/new">/products/new</a><br>
	<a href="/products/1">/products/1</a><br>
	<a href="/categories/new">/categories/new</a><br>
	<a href="/categories/1">/categories/1</a>
	<h1>Products</h1>
	<c:forEach var="product" items="${products}">
		<p>${product.getId()}    ${product.getName()}</p>
	</c:forEach>
	<h2>Categories</h2>
	<c:forEach var="category" items="${categories}">
		<p>${category.getId()}    ${category.getName()}</p>
	</c:forEach>
</body>
</html>