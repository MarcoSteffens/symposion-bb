<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="error.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.appspot.symposionbb.PMF" %>
<%@ page import="com.appspot.symposionbb.model.Forum" %>
<%@ page import="com.appspot.symposionbb.model.Board" %>
<%@ page import="com.appspot.symposionbb.model.Thread" %>
<%@page import="com.appspot.symposionbb.model.Comment"%>
<%@ page import="java.util.List" %>
<%@ page import="com.appspot.symposionbb.view.ForumBean" %>
<%@ page import="com.appspot.symposionbb.SymposionConsts" %>
<%
  //ForumBean fb = new ForumBean();


UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();

PersistenceManager pm = PMF.get().getPersistenceManager();

String query = "";
String forumKey="";
String boardKey="";

String paramForum = "";
String paramBoard = "";
String paramThread = "";
String paramComments = "";

/*
Der Parameter "forum" muss entweder immer oder nie angegeben sein.
"board" bezeichnet das Board, das auf der Startseite angezeigt wird
oder das vom Benutzer ausgewählt wurde. Muss immer angegeben sein bzw. ist, 
wenn nichts angegeben ist, das in sortierreichenfolge erste board.
"thread" ist der anzuzeigende Thread. Ist der parameter vorhanden, wird die
thread-seite angezeigt. ist er nicht vorhanden wird die board-übersicht und
das gewählte board angezeigt.
"comments" ist die Anzahl an kommentaren zu einem thread. wird nur auf der
thread-seite verwendet und dient dazu, zwischen schon besuchten und noch
nicht besuchten links unterscheiden zu können. hat hier also gar keine funktion,
nur im link auf diese seite, wie er auf der board-seite angezeigt wird.
*/

paramForum = request.getParameter("forum");
paramBoard = request.getParameter("board");
paramThread = request.getParameter("thread");
paramComments = request.getParameter("comments");

query = "select from " + Forum.class.getName();// + " WHERE Id == " + paramForum;
List<Forum> forums = (List<Forum>) pm.newQuery(query).execute();

Forum forum = null;
if (paramForum == "" || paramForum == null) {
	forum = forums.get(0); //ToDo: Vernünftige Auswahl sicherstellen. 
} else {
	for (Forum f : forums) {
		if (f.getKey().getId() == Long.parseLong(paramForum)) {
			forum = f;
		}
	}
}

if (forum == null) {
	response.sendRedirect("/error.jsp?forum_ist_null");
}

List<Board> boards = forum.getBoards();
Board board = null;
if (paramBoard == "" || paramBoard == null) {
	board = boards.get(0); //ToDo: Vernünftige Auswahl sicherstellen.
} else {
	for (Board b : boards) {
		if (b.getKey().getId() == Long.parseLong(paramBoard)) {
			board = b;
		}
	}
}

if (board == null) {
	response.sendRedirect("/error.jsp?board_ist_null");
}

/*
Hier sind jetzt natürlich alle Beiträge drin, die überhaupt am Board zu finden sind. Völlig unsortiert,
neue Themen und Kommentare zu allen Themen... Kurz: eine Menge Daten.
*/
List<Thread> threads = board.getThreads(); // TODO: besser machen.

//Die ältesten Themen gehören ans Ende der Liste
Collections.reverse(threads);

Thread thread = null;
List<Comment> replys = new ArrayList<Comment>();
if (paramThread == "" || paramThread == null) {
	//board = boards.get(0); //ToDo: Vernünftige Auswahl sicherstellen.
} else {
	for (Thread t : threads) {
		if (t.getKey().getId() == Long.parseLong(paramThread)) {
			thread = t;
		}
	}
	
	replys = thread.getReply();
	
}
%>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="robots" content="noindex, nofollow">
    <title><%= forum.getName() %></title>
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
			<%@ include file="_pagehead.jsp_" %>
		</div>

		<div id="Menu">
			<%@ include file="_menue_navigation.jsp_" %>
			<%//@ include file="_menue_search.jsp_" %>
			<%//@ include file="_menue_moderatoren.jsp_" %>
<% if (userService.isUserLoggedIn() && userService.isUserAdmin()) { %>
			<%@ include file="_menue_admin.jsp_" %>
<% } %>
			<%@ include file="_menue_accesskey.jsp_" %>
		</div>
	
		<div id="Inhalt">
			<!-- a class="navigation" href="#neuePosts">Zu den neuen Beiträgen</a -->
		
			<h2><a id="target" name="pagecontent_headline">Über Symposion BB</a></h2>

			<div id="separator"></div>
		
			<div id="topics">
			<p>
				Symposion BB ist ein kleines Projekt von mir, mit dem ich hauptsächlich drei Ziele verfolge:
			</p>
			<ol>
				<li>(Besser) programmieren lernen.</li>
				<li>Ein paar Ideen zum Aufbau eines Forums ausprobieren.</li>
				<li>Mich an einem Screenreader-tauglichen Aufbau versuchen.</li>
			</ol>
			<p>
				Wenn alles gut läuft, dann kommt dabei zwangsläufig eine sinnvolle und mit Screenreader gut zu benutzende Forum-Software heraus, vielleicht auch irgendwann ein kleines <em>Content Management System</em>. Was ich dann auch gern zur Verfügung stellen möchte. Im Moment ist aber noch alles in Arbeit, und auch diese Seiten hier nicht nichtmal halbfertig bzw. enthalten auch noch vieles, was später rausfällt! 
			</p>
			<h3>Interesse?</h3>
			<p>Ich freue mich natürlich (auch jetzt schon) über jeden, der sich für mein kleines Stückchen Software interessiert und würde ggf. auch ein wenig behilflich sein beim Installieren eines eigenen Forums. (Voraussetzung dafür ist ein Google-Konto, denn diese Software läuft ausschließlich auf der Google App Engine.) Im Moment ist es dafür allerdings noch etwas zu früh.</p>
			<p>Außerdem freue ich mich natürlich auch, wenn jemand Hirnschmalz investieren und sich hier konzeptionell beteiligen will. Insbesondere für die Sache mit der Barrierefreiheit fände ich Anregungen gut, aber gern auch bei allem anderen.</p>
			<p>Bei Interesse würde ich vorschlagen, hier einfach eine Nachricht im Foren-Bereich zu hinterlassen. Das sollte eigentlich immer funktionieren.</p>
			<p>(Es gibt auch eine Google Code Projektseite für Symposion BB, und zwar <a href="http://code.google.com/p/symposion-bb/">hier</a>.)</p>
			<h3>Achtung!</h3>
			<p>Diese Seiten hier sind gleichzeitig der finale Test für Symposion BB, und im Moment lösche ich noch in unregelmäßigen (und teilweise sehr kurzen) Abständen sämtliche Daten - und damit auch alle Einträge im Forum. Wenn mal was weg ist - einfach nochmal versuchen.</p>
			</div>
		</div>
		<%@ include file="_footnote.jsp_" %>
	
	</div>    
    
  </body>
</html>
<% 
	pm.close();		
%>

