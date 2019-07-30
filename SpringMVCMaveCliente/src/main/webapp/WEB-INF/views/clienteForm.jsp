<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRUD Cliente</title>
<style type="text/css">
		body {
			font-family: sans-serif;
		}
		.data, .data td {
			border-collapse: collapse;
			width: 100%;
			border: 1px solid #aaa;
			margin: 2px;
			padding: 2px;
		}
		.data th {
			font-weight: bold;
			background-color: #5C82FF;
			color: white;
		}
	</style>
</head>
<body>
<h2>Contact Manager</h2>
<c:url var="addAction" value="/cliente/add" ></c:url>

<form:form action="${addAction}" commandName="cliente" modelAttribute="cliente">


<h3>${message}</h3>

 <c:if test="${!empty cliente.nombre}">
    <tr>
        <td>
            <form:label path="id">
                <spring:message text="ID"/>
            </form:label>
        </td>
        <td>
            <form:input path="id" readonly="true" size="8"  disabled="true" /><br>
            <form:hidden path="id" />
        </td> 
    </tr>
    </c:if>
 
 NOMBRE: <form:input path="nombre"/><br>
 <form:errors path="nombre"/>
 
 DOMICILIO: <form:input path="domicilio"/><br>
 <form:errors path="domicilio"/>
     
 CODIGO: <form:radiobutton path="codigo" value="AFD1"/>AFD1
       <form:radiobutton path="codigo" value="AFD2"/>AFD2<br>
          
 TELEFONO: <form:input path="telefono"/><br>
            <form:errors path="telefono"/>  
            
 POBLACIÓN: <form:select path="poblacion">
                <form:option value=""></form:option>
 				<form:option value="Puebla">PUEBLA</form:option>
 				<form:option value="Oaxaca">OAXACA</form:option>
 				<form:option value="Tlaxcala">TLAXCALA</form:option>
 				<form:option value="Morelia">MORELIA</form:option>
            </form:select>    <br>       
                  
     CP: <form:select path="cp">
                <form:option value=""></form:option>
 				<form:option value="72000">72000</form:option>
 				<form:option value="75000">75000</form:option>
 				<form:option value="76000">76000</form:option>
 	        </form:select>    <br>      

 <c:if test="${!empty cliente.nombre}">
                <input type="submit"
                    value="<spring:message text="Edit Cliente"/>" />
            </c:if>

<c:if test="${empty cliente.nombre}">
                <input type="submit"
                    value="<spring:message text="Add Cliente"/>" />
            </c:if>
</form:form>
     

    <h3>CLIENTES</h3>
<table class="data" border="1">
<tr>
    <th>ID</th>
    <th>NOMBRE</th>
    <th>DOMICILIO</th>
    <th>CODIGO</th>
    <th>TEL</th>
    <th>POBLACION</th>
    <th>C.P.</th>
    <th>REMOVE</th>
    <th>EDIT</th>
</tr>
<c:forEach items="${listCliente}" var="cliente">
    <tr>
        <td>${cliente.id}</td>
        <td>${cliente.nombre}</td>
        <td>${cliente.domicilio}</td>
        <td>${cliente.codigo}</td>
        <td>${cliente.telefono}</td>
        <td>${cliente.poblacion}</td>
        <td>${cliente.cp}</td>
	<td><a href="<c:url value='/delete/${cliente.id}'/>">Delete</a></td>
	<td><a href="<c:url value='/edit/${cliente.id}'/>">Edit</a></td>
    </tr>
</c:forEach>
</table>    


</body>
</html>