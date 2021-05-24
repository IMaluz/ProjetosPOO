<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="br.com.luiza.web.Contatos"%>
<%@page import="br.com.luiza.web.Armazenamento"%>
<%@page import="java.util.ArrayList"%>
<%
if (request.getParameter("user.add") != null) {
	Contatos newContato = new Contatos(request.getParameter("contatos.nome"), request.getParameter("contatos.email"),
	request.getParameter("contatos.telefone"));
	Armazenamento.addContatos(newContato);
	response.sendRedirect(request.getRequestURI());
} else if (request.getParameter("contatos.remove") != null) {
	String email = request.getParameter("contatos.email");
	Armazenamento.removeContatos(email);
	response.sendRedirect(request.getRequestURI());
}
ArrayList<Contatos> contato = Armazenamento.getContatos();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	} else {
	%>
	<%@include file="WEB-INF/jspf/headerLogout.jsp"%>
	<br><br><br><br><br><br>
	<div class="container">
	<form method="post">
		<div class="row">
		    <div class="col">
				Nome: <input type="text" name="contatos.nome"/> 
			</div>
			<div class="col">
				Email: <input type="email" name="contatos.email"/> 
			</div>
			<div class="col">
				Telefone: <input type="text" name="contatos.telefone"/> 
			</div>
		</div>	
		<br>
		<div class="row d-flex justify-content-center">
			<input type="submit" name="user.add" value="Adicionar"/>
		</div>
	</form>
	<br><br>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Nome</th>
					<th scope="col">Email</th>
					<th scope="col">Telefone</th>
					<th scope="col">Exclusão</th>
				</tr>
			</thead>
			<%
			for (Contatos contatos : contato) {
			%>
			<tbody>
				<tr>
					<td><%=contatos.getNome()%></td>
					<td><%=contatos.getEmail()%></td>
					<td><%=contatos.getTelefone()%></td>
					<td>
						<form>
							<input type="hidden" name="contatos.email"
								value="<%=contatos.getEmail()%>" /> <input type="submit"
								name="contatos.remove" value="Remover" />
						</form>
					</td>
				</tr>
			</tbody>
			<%}%>
		</table>
	</div>
	<%}%>
	
	<div class="d-flex flex-row justify-content-center align-items-center">
		<footer>
		    <br><br><br><br>
			<%@include file="WEB-INF/jspf/footer.jsp"%>
		</footer>
	</div>
</body>
</html>