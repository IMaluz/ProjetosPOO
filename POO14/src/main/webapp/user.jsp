<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="br.com.luiza.web.User"%>
<%@page import="br.com.luiza.web.Armazenamento"%>
<%@page import="java.util.ArrayList"%>
<%
if (request.getParameter("user.add") != null) {
	User newUser = new User(request.getParameter("user.nome"), request.getParameter("user.email"),
	request.getParameter("user.password").hashCode());
	Armazenamento.addUser(newUser);
	response.sendRedirect(request.getRequestURI());
} else if (request.getParameter("user.remove") != null) {
	String email = request.getParameter("user.email");
	Armazenamento.removeUser(email);
	response.sendRedirect(request.getRequestURI());
}

ArrayList<User> users = Armazenamento.getUsers();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usuários</title>
<link href="style/style.css" rel="stylesheet" />
<%@include file="WEB-INF/jspf/links.jsp"%>
</head>
<body>
<body>
	<%
	if (session.getAttribute("session.nome") == null) {
	%>
	<%@include file="WEB-INF/jspf/header.jsp"%>
	<script>
		alert("Desculpa, infelizmente você não tem acesso a essa página :(");
		location = './index.jsp';
	</script>
	<%
	} else if (!session.getAttribute("session.nome").equals("Bernardo")) {
	%>
	<script>
		alert("É necessário ser um administrador para ter acesso a essa página!");
		location = './index.jsp';
	</script>
	<%
	} else {
	%>
	<%@include file="WEB-INF/jspf/headerLogout.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<form method="post">
			<div class="row">
				<div class="col">
					Nome: <input type="text" name="user.nome" />
				</div>
				<div class="col">
					Email: <input type="email" name="user.email" />
				</div>
				<div class="col">
					Senha: <input type="text" name="user.password" />
				</div>
			</div>
			<br>
			<div class="row d-flex justify-content-center">
				<input type="submit" name="user.add" value="Adicionar" />
			</div>
		</form>
		<br> <br>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Nome</th>
					<th scope="col">Email</th>
					<th scope="col">Exclusão</th>
				</tr>
				<%
				for (User user : users) {
				%>
				<tr>
					<td><%=user.getNome()%></td>
					<td><%=user.getEmail()%></td>
					<td>
						<form>
							<input type="hidden" name="user.email"
								value="<%=user.getEmail()%>" /> <input type="submit"
								name="user.remove" value="Remover" />
						</form>
					</td>
				</tr>
				<%
				}
				%>
		</table>
	</div>
	<% } %>
	
	<div class="d-flex flex-row justify-content-center align-items-center">
		<footer>
		    <br><br><br><br>
			<%@include file="WEB-INF/jspf/footer.jsp"%>
		</footer>
	</div>
</body>
</body>
</html>