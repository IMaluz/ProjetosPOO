<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="br.com.luiza.web.User"%>
<%@page import="br.com.luiza.web.Armazenamento"%>
<%@page import="java.util.ArrayList"%>

<%
String errorMessage = null;
if(request.getParameter("session.login")!=null){
    String email = request.getParameter("session.email");
    String pass = request.getParameter("session.password");
    User user = Armazenamento.getUser(email, pass);
    if(user != null){
        session.setAttribute("session.nome", user.getNome());
        session.setAttribute("session.email", user.getEmail());
        response.sendRedirect(request.getRequestURI());}
}else if(request.getParameter("session.logout")!=null){
    session.removeAttribute("session.nome");
    session.removeAttribute("session.email");
    response.sendRedirect(request.getRequestURI());
}
%>
<html>
<head>
<link href="style/style.css" rel="stylesheet" />
<%@include file="WEB-INF/jspf/links.jsp"%>
</head>

<body>
        <% if(session.getAttribute("session.nome") == null) { %>
        <%@include file="WEB-INF/jspf/header.jsp"%>
        <div class="container">
	        <br><br><br><br>
	        <p>Faça login para ter acesso a todas funcionalidades! :)</p>
        </div>
        <%}else { %>
        <%@include file="WEB-INF/jspf/headerLogout.jsp"%>
        <div class="container">
	        <br><br><br><br>
	        <p>Muito bem, agora você tem acesso a todo nosso conteúdo!!</p>
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