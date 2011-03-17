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
			<!-- a class="navigation" href="#neuePosts">Zu den neuen Beiträgen</a -->
		
			<h2><a name="pagecontent_headline">Ups...</a></h2>
		
			<div id="separator"></div>
		
			<div id="error">
			
				<p>Scheint als wäre ein Fehler aufgetreten. Fehlermeldung:</p>
				
				<div id="errormessage">
					<pre>Hier ist wohl was dummes passiert.</pre>	
				</div>
				<p>Don't call us - we'll call you!</p>
				
				<p><a href="../">Zurück zur Startseite</a></p>
			
			</div>
			
			<!-- div id="separator"></div>
			<div id="buttons">
				<form action="/newTopic.jsp" method="link">
				<input type="submit" value="Neues Thema hinzufügen">
				</form>
			</div -->
		</div>
	
	<%@ include file="_footnote.jsp" %>
	
	</div>    
    
  </body>
</html>

