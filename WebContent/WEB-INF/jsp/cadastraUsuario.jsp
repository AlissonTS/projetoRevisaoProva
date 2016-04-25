<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Página de Cadastro - Revisão Java WEB</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/login.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<body>
	
		<c:if test="${not empty usuarioLogado }">
			<br><br>
			<p style="text-align: center"><a href="index.jsp">Página de Login</a></p>
			<p style="text-align: center"><a href="mvc?logica=RedirecionaPrincipalLogica">Página Principal</a></p>
			<p style="text-align: center"><a href="mvc?logica=RedirecionaCadastraUsuarioLogica">Cadastrar Usuários</a></p>
			<p style="text-align: center"><a href="mvc?logica=LogoutLogica">Logout</a></p>
			<br>
			<h2 style="text-align: center">Usuário ${usuarioLogado.login} - Cadastro de novos Usuários: </h2>
			<br>
			<h2 style="text-align: center">Formulário:</h2>
			
			<form action="/projetoRevisaoProva/mvc?logica=InserirUsuarioLogica" method="post">
				<c:if test="${not empty usuario }">
					<h2 style="text-align: center">Alterar usuário: ${usuario.login}</h2>
					<p style="text-align: center"><input type="hidden" name="id" value="${usuario.id }" /></p>
				</c:if>
				
				<hr style="border-color: black;">
				<div class="form-group">
					<p style="text-align: center"><label for="login">Login </label><input type="text"
						id="login" name="login"
						value="${usuario.login }" placeholder="Login"></p>
				</div>
				
				<div class="form-group">
					<p style="text-align: center"><label for="senha">Senha </label><input type="text"
						 id="senha" name="senha"
						value="${usuario.senha }" placeholder="Senha"></p>
				</div>
				
				<p style="text-align: center"><button type="submit">Adicionar</button></p>
			</form>	
			
			<br>
			<div class="container">
				<h2 style="text-align: center">Lista de Usuários</h2>
				<table class="text-center table table-bordered table-responsive">
				<thead>
						<tr>
							<th class="text-center">Login </th>
							<th class="text-center">Senha </th>
							<th class="text-center"><i class="fa fa-cog"></i></th>
						</tr>
					</thead>
					<tbody>
	
						<c:forEach var="usuario" items="${usuarios}">
							<tr>
								<td>${usuario.login}</td>
								<td>${usuario.senha}</td>
	
								<td><a class="btn btn-success"
									href="mvc?logica=BuscarUsuario&&id=${usuario.id}"
									title="Alterar Usuário"><i class="fa fa-refresh"></i></a> <i
									class="fa fa-arrows-h"></i> <a class="btn btn-danger"
									href="mvc?logica=RemoverUsuario&&id=${usuario.id}"
									title="Deletar Usuário"><i class="fa fa-trash"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		
		
		<c:if test="${empty usuarioLogado}">
			<h1>Usuário não logado!</h1>
		</c:if>
		
	</body>
</html>