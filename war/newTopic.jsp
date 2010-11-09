<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<html>
  <head>
    <!-- meta http-equiv="content-type" content="text/html; charset=UTF-8" -->
    <meta name="robots" content="noindex, nofollow">
    <title>Symposion</title>
	<link rel="shortcut icon" href="favicon.ico">
	<!-- link rel="icon" type="image/gif" href="animated_favicon1.gif" -->
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	<script type="text/javascript" src="../scripts/javascript.js" charset="ISO-8859-1"></script>
	<style type="text/css">
		<!--
		-->
	</style>
  </head>
  <body>
   
	<div id="Seite">
	
		<div id="pagehead">
			<%@ include file="_pagehead.jsp" %>
		</div>
		
		<div id="Menu">
			<%@ include file="_menue_navigation.jsp" %>
			<%@ include file="_menue_search.jsp" %>
			<%@ include file="_menue_moderatoren.jsp" %>
			<%@ include file="_menue_admin.jsp" %>
			<%@ include file="_menue_accesskey.jsp" %>
		</div>
	
		<div id="Inhalt">
		
		<h2>Neues Thema erstellen</h2>
		
		<table border="0">
			<tr>
				<td>Titel:</td>
				<td><input type="text" size="40" maxlength="60" name="title"></td>
			</tr>
			<tr>
				<td>Inhalt:</td>
				<td><textarea cols="30" rows="8" name="inhalt"></textarea></td>
			</tr>
			<tr>
				<td>Autor:</td>
				<td>Max Mustermann</td>
			</tr>
		</table>		
		<div id="buttons">
			<form action="/forum.jsp" method="link">
			<input type="submit" value="Abbrechen">
			<input type="submit" value="Senden">
			</form>
		</div>
</div>
	
	<%@ include file="_footnote.jsp" %>
	
	</div>    
    
  </body>
</html>
