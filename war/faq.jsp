<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<html>
  <head>
    <!-- meta http-equiv="content-type" content="text/html; charset=UTF-8" -->
    <title>Symposion</title>
	<link rel="shortcut icon" href="favicon.ico">
	<!-- link rel="icon" type="image/gif" href="animated_favicon1.gif" -->
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  <body>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    } else {
%>
<p><a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a></p>
<%
    }
%>
   
	<div id="Seite">
	
		<div id="pagehead">
			<%@ include file="_pagehead.jsp" %>
		</div>
		
		<div id="Menu">
			<%@ include file="_menue_navigation.jsp" %>
			<%@ include file="_menue_search.jsp" %>
			<%@ include file="_menue_moderatoren.jsp" %>
			<%@ include file="_menue_admin.jsp" %>
		</div>
	
		<div id="Inhalt">
			<!-- a class="navigation" href="#neuePosts">Zu den neuen Beiträgen</a -->
		
			<h2>Frequently Ask Questions</h2>
			
			<p>bla</p>
			<p>bla</p>
			<p>bla</p>
			<p>bla</p>
			<p>bla</p>
			<p>bla</p>
			<p>bla</p>
		
		</div>
	
	<%@ include file="_footnote.jsp" %>
	
	</div>    
    
  </body>
</html>
