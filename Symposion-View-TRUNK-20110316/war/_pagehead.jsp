<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
%>
		<h1>Name des Forums</h1><!-- &Sigma;&Upsilon;&Mu;&Pi;&Omicron;&Sigma;&Iota;&Omicron;&Nu; -->
<div id="accessibility">
<a href="/screenreader.jsp">Hinweis für Nutzer von Screenreadern</a>
</div>
<%
    if (user != null) {
%>
<div id="login">
Angemeldet als: <%= user.getNickname() %> (<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">abmelden</a>)
</div>
<%
    } else {
%>
<div id="login">
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">anmelden</a>
</div>
<%
    }
%>
		<!-- p>Die Beschreibung des Forums kann auch mehrzeilig sein, aber mehrere Absätze sind vermutlich nicht unbedingt notwendig.</p -->
