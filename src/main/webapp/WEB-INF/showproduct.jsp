<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
</head>
<body>
	<a href="/products/new">/products/new</a><br>
	<a href="/products/1">/products/1</a><br>
	<a href="/categories/new">/categories/new</a><br>
	<a href="/categories/1">/categories/1</a>
	<h1>${product.getName()} Price: ${product.getPrice()}</h1>
	<h3>Categories</h3>
	<p>add categories: </p>
	<c:if test="${categories.size()>0}">
		
	<form:form action="/products/${product.getId()}" method="post" modelAttribute="product">
	<input type="hidden" name="_method" value="put">
		<form:select  path="categories">			
			<c:forEach var="newcat" items="${categories}">
				<form:option value="${newcat.getId()}">${newcat.getName()}</form:option>	
			</c:forEach>
		</form:select>
		<form:button type="submit"> Add </form:button>
	</form:form>	
	
	</c:if>



	<h5>Categories(self):</h5>
	<c:if test="${product.getCategories().size()==0}"><p>No Products assigned!<p></c:if>
	<c:forEach var="category" items="${product.getCategories()}">
		<p>- ${category.getName()}</p>	
	</c:forEach>
</body>
</html>