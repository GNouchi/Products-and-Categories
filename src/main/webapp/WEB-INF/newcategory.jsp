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
	<a href="/categories/1">/categories/1</a><br>
	
	<h1>This is New Category</h1>
	<form:form action="/categories/new" method="post" modelAttribute="category" >
		<form:errors path="name"/><br>
		<form:label path="name">Name</form:label>
		<form:input path="name"></form:input>
		<form:button type="submit"> Create</form:button>
	</form:form>

</body>
</html>