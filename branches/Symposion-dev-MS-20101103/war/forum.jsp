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
		
			<h2>Ein Board</h2>
		
			<input type="checkbox" name="Name" value=""> Nur neue und erweiterte Themen anzeigen
		
			<div id="topics">
				<p><!-- img align="left" id="link1184321" src="/img/pin.jpg" alt="Sticky" border="0" height="16" width="16" / -->
					<a href="../topic.jsp">Problem rendering tikz-qtree output rendering tikz-qtree output rendering tikz-qtree output rendering</a>
					<em>Kristian Gärtner</em><span>(6 Kommentare)</span></p>
				<p><a href="/topic.jsp?comments=1" title="">typo in the news page title</a>
					<em>Jessika Lowe</em><span>(0)</span></p>
				<p><a href="/topic.jsp?comments=2" title="">Full screen without scrolling bar</a>
					<em>Kristian Gottschalk</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=3" title="">Show/view forms data</a>
					<em>Angelika Kortig</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=4" title="">Translations for the web page</a>
					<em>Daniel Molina</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=5" title="">New (sort of redundant) button for viewing</a>
					<em>Claus Petersen</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=6" title="">resume after crash</a>
					<em>Petra Wagner</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=7" title="">A few UI feature requests</a>
					<em>Uta Förster</em><span>(3)</span></p>
				<p><a href="/topic.jsp?comments=8" title="">Request: menu entry for the old full-screen mode</a>
					<em>Christine Kappel</em><span>(0)</span></p>
				<p><a href="/topic.jsp?comments=9" title="">Feature Request: Multiple view of a single document</a>
					<em>Kathrin Neumann</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=10" title="">OneNote linked notes</a>
					<em>Tobias Bergmann</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=11" title="">Feature Request: PDF playlist/queue</a>
					<em>Martin Hüber</em><span>(2)</span></p>
				<p><a href="/topic.jsp?comments=12" title="">feature enquiry/request</a>
					<em>Leonie Dietrich</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=13" title="">.Net Component</a>
					<em>Stephanie Scholz</em><span>(2)</span></p>
				<p><a href="/topic.jsp?comments=14" title="">Print rotated pages</a>
					<em>Maria Hartmann</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=15" title="">Feature Request: Shortcuts for view menu</a>
					<em>Sabine Meier</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=16" title="">Gap between pages in facing mode</a>
					<em>Juliane Hoch</em><span>(0)</span></p>
				<p><a href="/topic.jsp?comments=17" title="">Improvement for synctex's forward search</a>
					<em>Petra Wagner</em><span>(5)</span></p>
				<p><a href="/topic.jsp?comments=18" title="">PDF with passwords is not opening</a>
					<em>Ursula Lang</em><span>(2)</span></p>
				<p><a href="/topic.jsp?comments=19" title="">More print options?</a>
					<em>Philipp Schwarz</em><span>(1)</span></p>
				<p><a href="/topic.jsp?comments=20" title="">2215 prerelease</a>
					<em>Mandy Bürger</em><span>(3)</span></p>
				<p><a href="/topic.jsp?comments=21" title="">Version 1.1 using "-restrict" on start up</a>
					<em>Lucas Schmid</em><span>(3)</span></p>
				<p><a href="/topic.jsp?comments=22" title="">Refresh file without jittering</a>
					<em>Luca Jung</em><span>(13)</span></p>
				<p><a href="/topic.jsp?comments=23" title="">Image "ghosting"</a>
					<em>Jürgen Maur</em><span>(6)</span></p>
				<p><a href="/topic.jsp?comments=24" title="">When will be available official 64-bit version?</a>
					<em>Leon Diederich</em><span>(2)</span></p>
			</div>
			
			<!-- div id="buttons"><input type="button" name="Name" value="Neues Thema erstellen" onclick="Aktion"></div -->
			<div id="buttons"><!-- a href="/newTopic.jsp">Neues Thema hinzufügen</a -->
				<form action="/newTopic.jsp" method="link">
				<input type="submit" value="Neues Thema hinzufügen">
				</form>
			</div>
		</div>
	
	<%@ include file="_footnote.jsp" %>
	
	</div>    
    
  </body>
</html>
