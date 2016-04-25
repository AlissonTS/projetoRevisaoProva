<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Página Inicial - Revisão Java WEB</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/login.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<body>		
			<c:if test="${not empty msg }">
				<h1 style="text-align: center">Dados inválidos! </h1>
			</c:if>
			
			<c:if test="${empty usuarioLogado }">
				<h1 style="text-align: center">Formulário de Login - Aplicação Revisão de Prova:</h1>
				<form action="/projetoRevisaoProva/mvc?logica=LogarLogica" method="post">
					<p style="text-align: center"><input type="text" id="login" name="login" placeholder="Login" required autofocus/></p>
		            <p style="text-align: center"><input type="password" id="senha" placeholder="Senha" name="senha" required/></p>
		            <br>
		            <p style="text-align: center"><button type="submit" name="opcao" value="logar">Logar</button></p>
				</form>
			</c:if>
			<c:if test="${not empty usuarioLogado }">
				<br><br>
				<h1 style="text-align: center">Usuário Logado!</h1>
				<p style="text-align: center"><a href="mvc?logica=RedirecionaPrincipalLogica">Página Principal</a></p>
				<p style="text-align: center"><a href="mvc?logica=RedirecionaCadastraUsuarioLogica">Cadastrar Usuários</a></p>
				<p style="text-align: center"><a href="mvc?logica=LogoutLogica">Logout</a></p>
			</c:if>
	</body>
</html>