<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Página Principal - Revisão Java WEB</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/login.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<body>
			<br><br>
			<c:if test="${not empty usuarioLogado }">
				<h1 style="text-align: center">Bem vindo ${usuarioLogado.login}! </h1>
				
				<p style="text-align: center"><a href="mvc?logica=RedirecionaCadastraUsuarioLogica">Cadastrar Usuários</a></p>
				<p style="text-align: center"><a href="index.jsp">Página de Login</a></p>
				<p style="text-align: center"><a href="mvc?logica=LogoutLogica">Logout</a></p>
				
			</c:if>
			<c:if test="${empty usuarioLogado}">
				<p>Usuário não logado!</p>
				<p style="text-align: center"><a href="index.jsp">Página de Login</a></p>
			</c:if>
			
	</body>
</html>