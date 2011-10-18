		<h1><%= forum.getName() %></h1><!-- &Sigma;&Upsilon;&Mu;&Pi;&Omicron;&Sigma;&Iota;&Omicron;&Nu; -->
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
		<!--  p><%= forum.getDescription() %></p -->
