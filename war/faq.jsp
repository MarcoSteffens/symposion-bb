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
		
			<h2><a id="target" name="pagecontent_headline">Frequently Ask Questions</a></h2>

			<div id="separator"></div>
		
			<div id="topics">
				<ol>
					<li>Warum gibt es hier eine Seite für Fragen, aber keine Fragen?</li>
					<p>Gute Frage!</p>
					<li>Und jetzt?</li>
					<p>Abwarten...</p>
				</ol>
			</div>
		</div>
		<%@ include file="_footnote.jsp_" %>
	
	</div>    
    
  </body>
</html>
<% 
	pm.close();		
%>
