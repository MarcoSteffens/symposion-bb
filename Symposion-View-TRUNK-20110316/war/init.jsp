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
		</div>
	
		<div id="Inhalt">
		
			<h2><a name="pagecontent_headline">Neues Forum anlegen</a></h2>
		
		    <form action="/init" method="post">
				<table border="0">
					<tr>
						<td>Titel des Forums:</td>
						<td><input type="text" size="40" maxlength="60" name="title"></td>
					</tr>
					<tr>
						<td>Beschreibung des Forums:</td>
						<td><textarea cols="30" rows="8" name="description"></textarea></td>
					</tr>
					<tr>
						<td>Name eines Boards:</td>
						<td><input type="text" size="40" maxlength="60" name="board"></td>
					</tr>
					<tr>
						<td>Moderator:</td>
						<td>Max Mustermann</td>
					</tr>
				</table>		
				<div align="Center">
					<input type="submit" value="Speichern">
				</div>
		    </form>
		
		</div>
			
			<!-- div id="separator"></div>
			<div id="buttons">
				<form action="/newTopic.jsp" method="link">
				<input type="submit" value="Neues Thema hinzufügen">
				</form>
			</div -->
	
	<%@ include file="_footnote.jsp" %>
	
	</div>    
    
  </body>
</html>
