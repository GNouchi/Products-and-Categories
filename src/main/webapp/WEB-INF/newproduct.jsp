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
	<a href="/products/new">/products/new</a><br>
	<a href="/products/1">/products/1</a><br>
	<a href="/categories/new">/categories/new</a><br>
	<a href="/categories/1">/categories/1</a>
	<h1>This is New Product</h1>
	<form:form action="/products/new" method="post" modelAttribute="product" >
		<form:errors path="name"/><br>
		<form:label path="name">Name</form:label><br>
		<form:input path="name"></form:input><br>
		<form:errors path="description"/><br>
		<form:label path="description">Description</form:label><br>
		<form:textarea path="description"></form:textarea><br>
		<form:errors path="price"/><br>
		<form:label path="price">Price</form:label><br>
		<form:input type="number" step="0.01" path="price"></form:input><br><br>
		<form:button type="submit"> Create</form:button>
	</form:form>
</body>
</html>