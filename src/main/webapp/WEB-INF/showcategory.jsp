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
	<h1>${category.getName()}</h1>
	<h3>Products</h3>
	<p>add Products: 	</p>

	<c:if test="${products.size()>0}">	
		<form:form action="/categories/${category.getId()}" method="post" modelAttribute="category">
		<input type="hidden" name="_method" value="put">
		<form:select path="products">			
				<c:forEach var="newprod" items="${products}">
					<form:option value="${newprod.getId()}">${newprod.getName()}</form:option>	
				</c:forEach>
		</form:select>
		<form:button type="submit"> Add </form:button>
		</form:form>	
	</c:if>

	<h5>Products(self):</h5>
	<c:if test="${category.getProducts().size()==0}"><p>No Products assigned!<p></c:if>
	<c:forEach var="product" items="${category.getProducts()}">
		<p>- ${product.getName()}</p>	
	</c:forEach>
</body>
</html>