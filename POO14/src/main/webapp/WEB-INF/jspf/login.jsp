<%@ page pageEncoding="UTF-8"%>
<%@page import="br.com.luiza.web.User"%>
<%@page import="br.com.luiza.web.Armazenamento"%>
<%@page import="java.util.ArrayList"%>

<%
String errorMessage = null;
if (request.getParameter("session.login") != null) {
	String email = request.getParameter("session.email");
	String pass = request.getParameter("session.password");
	User user = Armazenamento.getUser(email, pass);
	 if(user != null){
         session.setAttribute("session.nome", user.getNome());
         session.setAttribute("session.email", user.getEmail());
         response.sendRedirect(request.getRequestURI());
     }
} else if (request.getParameter("session.logout") != null) {
	session.removeAttribute("session.nome");
	session.removeAttribute("session.email");
	response.sendRedirect(request.getRequestURI());
}
%>
<%
if (session.getAttribute("session.nome") == null) {
%>
<div class="container">
	<form action="index.jsp" method="post">
		<div id="login-box">
			<div class="titulo">
				<h1 class="logo-caption">
					<span class="tweak">L</span>ogin
				</h1>
			</div>
			<div class="controls">
				<input type="text" name="session.email" placeholder="Username"
					class="form-control" required/> <input type="password"
					name="session.password" placeholder="Password" class="form-control" required/>
				<button type="submit" name="session.login"
					class="btn btn-default btn-block btn-custom">Login</button>
			</div>
		</div>
	</form>
</div>
<div id="particles-js"></div>
<script type="text/javascript" src="script/script.js"></script>
<%
} else {
%>
<div class="container">
	<form action="index.jsp" method="post">
		<div id="login-box">
			<div class="titulo">
				<h1 class="logo-caption">
					<span class="tweak">L</span>ogout
				</h1>
			</div>
			<div class="controls">
				<button type="button" class="btn btn-default btn-block btn-custom"
					onclick="location.href='http://localhost:8080/POO14/index.jsp';">
					<span>Retornar</span>
				</button>
				<button type="submit" class="btn btn-default btn-block btn-custom" name="session.logout">
					<span>Sair</span>
				</button>
			</div>
		</div>
	</form>
</div>
<div id="particles-js"></div>
<script type="text/javascript" src="script/script.js"></script>
<%}%>