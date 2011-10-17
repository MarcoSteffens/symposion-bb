<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.appspot.symposionbb.beans.MyJavaBean" %>

<%
	MyJavaBean jb = new MyJavaBean();
%>
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
			<!-- a class="navigation" href="#neuePosts">Zu den neuen Beiträgen</a -->
		
			<h2><a id="target" name="pagecontent_headline">Ein Board<%       out.println( "(" + jb.getDateString() + ")" );
 %></a></h2>
			<!-- a href="/topic?id=1183321#1184321" title="Nur neue oder geänderte Beiträge anzeigen"><img id="link1184321" src="/img/delete.jpg" alt="Hier klicken, um nur neue oder geänderte Beiträge anzuzeigen." border="0" height="16" width="16"></a -->
			<div id="showNew">Zur Zeit werden alle Beiträge angezeigt. <a id="showNewLink" href="javascript:toggle();">Nur neue oder geänderte anzeigen.</a></div>
			<div id="showAll">Zur Zeit werden nur neue oder geänderte Beiträge angezeigt. <a id="showAllLink" href="javascript:toggle();">Alle anzeigen.</a></div>
			<div id="separator"></div>
		
			<div id="topics">
				<p name="newPost"><!-- img align="left" id="link1184321" src="/img/pin.jpg" alt="Sticky" border="0" height="16" width="16" / -->
					<a href="../topic.jsp">In Centonovella ich las, zu Florenz vor Zeiten sa&szlig; ein jung Edelmann, weit erkannt.</a>
					<em>Hans Sachs</em><span>(6 Kommentare)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=1" title="">Fridrich Alberigo genannt.</a>
					<em>Jessika Lowe</em><span>(0)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=2" title="">Der in herzlich Liebe brennet gen einem edlen Weib, genennet Giovanna.</a>
					<em>Kristian Gottschalk</em><span>(1)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=3" title="">An Gut sehr reich, an Ehren stet und gar lobleich.</a>
					<em>Angelika Kortig</em><span>(1)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=4" title="">Sie verachtet all sein Lieb, an ihrem Herren treulich blieb.</a>
					<em>Daniel Molina</em><span>(1)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=5" title="">Reichlich Friederich ausgab, bis er verschwendet gro&szlig;e Hab.</a>
					<em>Claus Petersen</em><span>(1)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=6" title="">Er verpf&auml;ndet all sein Gut, zog auf ein Sitz und in Armut.</a>
					<em>Petra Wagner</em><span>(1)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=7" title="">Nichts dann ein edlen Falken h&auml;tt, mit dem er t&auml;glich jagen t&auml;t.</a>
					<em>Uta Förster</em><span>(3)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=8" title="">Ihr Herr, der starb und sich begab.</a>
					<em>Christine Kappel</em><span>(0)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=9" title="">Der Frauen Sohn, ein junger Knab ward schwerlich krank.</a>
					<em>Kathrin Neumann</em><span>(1)</span></p>
				<p name="newPost"><a href="/topic.jsp?comments=10" title="">Bis in den tod</a>
					<em>Tobias Bergmann</em><span>(1)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=11" title="">Sprach: &quot;Mutter, ich bitt dich durch Gott, hilf, da&szlig; Friedrichs Falk mir werd, so nimmt ein End all mein Beschwerd.&quot;.</a>
					<em>Martin Hüber</em><span>(2)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=12" title="">Die Mutter tr&ouml;st&#39; ihn, den zu bringen.</a>
					<em>Leonie Dietrich</em><span>(1)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=13" title="">Kam zu Friedrich in den Dingen.</a>
					<em>Stephanie Scholz</em><span>(2)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=14" title="">Zum Fr&uuml;hmal t&auml;t sich laden, froh war Friedrich ihrer Gnaden.</a>
					<em>Maria Hartmann</em><span>(1)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=15" title="">H&auml;tt doch weder Fleisch noch Fisch damit er speiset seinen Tisch.</a>
					<em>Sabine Meier</em><span>(1)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=16" title="">Armut, Ungl&uuml;ck t&auml;t ihn walken.</a>
					<em>Juliane Hoch</em><span>(0)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=17" title="">Er w&uuml;rgt sein lieben Falken.</a>
					<em>Petra Wagner</em><span>(5)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=18" title="">Briet den und zu Tische trug, zerlegt ihn h&ouml;flich, klug.</a>
					<em>Ursula Lang</em><span>(2)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=19" title="">Nach dem sprach die Frau mit Sitten.</a>
					<em>Philipp Schwarz</em><span>(1)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=20" title="">&quot;Durch euer Lieb will ich euch bitten um euren edlen Falken gut.</a>
					<em>Mandy Bürger</em><span>(3)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=21" title="">Nach dem mein Sohn sich sehnen tut.</a>
					<em>Lucas Schmid</em><span>(3)</span></p>
				<p name="oldPost"><a href="/topic.jsp?comments=22" title="">Todkrank, wo ihr ihm den tut geben, rettet ihr sein junges Leben.</a>
					<em>Luca Jung</em><span>(13)</span></p>
			</div>
			
			<div id="separator"></div>
			
			<!-- div id="buttons"><input type="button" name="Name" value="Neues Thema erstellen" onclick="Aktion"></div -->
			<div id="buttons">
				<form action="/newTopic.jsp" method="link">
<%
    if (user != null) {
%>
					<input type="submit" value="Neues Thema hinzufügen">
<% } else { %>
					<input alt="test" type="submit" value="Neues Thema hinzufügen" disabled="disabled" /><br />
					Hinweis: Zum Schreiben bitte <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">anmelden</a>.
<% } %>					
				</form>
			</div>
		</div>
	
	<%@ include file="_footnote.jsp" %>
	
	</div>    
    
  </body>
</html>
