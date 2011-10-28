<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.appspot.symposionbb.PMF" %>
<%@ page import="com.appspot.symposionbb.model.Forum" %>
<%@ page import="com.appspot.symposionbb.model.Board" %>
<%@ page import="com.appspot.symposionbb.model.Thread" %>
<%@ page import="java.util.List" %>
<%@ page import="com.appspot.symposionbb.SymposionConsts" %>

<%

	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();

	PersistenceManager pm = PMF.get().getPersistenceManager();
	
	String query = "";
	String paramForum = "";
	String paramBoard = "";
	String paramThread = "";
	String paramComments = "";

	paramForum = request.getParameter("forum");
	paramBoard = request.getParameter("board");
	paramThread = request.getParameter("thread");
	paramComments = request.getParameter("comments");
	
	if (paramForum == "" || paramForum == null)
		response.sendRedirect("/error.jsp");
	
	
	/* query = "select from " + Board.class.getName();
	List<Board> boards = (List<Board>) pm.newQuery(query).execute();
	 */
		
	query = "select from " + Forum.class.getName();// + " WHERE Id == " + paramForum;
	List<Forum> forums = (List<Forum>) pm.newQuery(query).execute();
	
	Forum forum = null;
	for (Forum f : forums) {
		if (f.getKey().getId() == Long.parseLong(paramForum)) {
			forum = f;
		}
	}
	
	if (forum == null)
		response.sendRedirect("/error.jsp");
	
	List<Board> boards = forum.getBoards();
	Board board = null;
	for (Board b : boards) {
		if (b.getKey().getId() == Long.parseLong(paramBoard)) {
			board = b;
		}
	}
	

	if (board == null)
		response.sendRedirect("/error.jsp");
	
	List<Thread> threads = board.getThreads();
	
%>

<% /*
	if (request.getParameterNames().hasMoreElements()) { 
		Enumeration enumeration = request.getParameterNames();
%>
		<div>request parameters:</div>
<%
		while (enumeration.hasMoreElements()) {
			String key = (String)enumeration.nextElement();
%>
			<div><%= key %> - <%= request.getParameter(key) %></div>
<%
		}
	}
*/ %>
<html>
  <head>
    <!-- meta http-equiv="content-type" content="text/html; charset=UTF-8" -->
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
			<%// @include file="_menue_navigation.jsp_" %>
			<%// @include file="_menue_search.jsp_" %>
			<%// @include file="_menue_moderatoren.jsp_" %>
			<%// @include file="_menue_admin.jsp_" %>
			<%// @include file="_menue_accesskey.jsp_" %>
		</div>
	
		<div id="Inhalt">
		
		<h2><a name="pagecontent_headline">Neues Thema erstellen</a></h2>
		
		<form action="/newThread" method="post">
			<input type="hidden" name="forumKey" value="<%= forum.getKey().getId() %>">
			<input type="hidden" name="boardKey" value="<%= board.getKey().getId() %>">
			<!-- input type="hidden" name="threadKey" value="<% //thread.getKey(); %>" -->
			<table border="0">
				<tr>
					<td>Titel:</td>
					<td><input type="text" size="40" maxlength="160" name="topicTitle" value="Neuer Topic"></td>
				</tr>
				<tr>
					<td>Inhalt:</td>
					<td><textarea cols="30" rows="8" name="threadContent">Bla bla bla. Bla bla. Dieser Beitrag wird angehängt an Board <%= board.getKey().getId() %> im Forum <%= forum.getKey().getId() %>.</textarea></td>
				</tr>
				<tr>
					<td>Autor:</td>
<% if (forum.isRegistrationPossible()) { %>					
					<td><input type="text" size="40" maxlength="60" name="threadAuthor" value="<% if (session.getAttribute("Author") != null) out.print(session.getAttribute("Author")); else if (user != null) out.print(user.getNickname()); %>"></td>
<% } else if (forum.isRegistrationNeededForWriting()) { %>					
					<td><input type="hidden" name="threadAuthor" value="<%= user.getUserId() %>"><%= user.getUserId() %></td>
<% } %>					
				</tr>
			</table>		
			<div class="obfuscator d">
				Tragen Sie hier nichts ein: Plz <input type="text" size="5" maxlength="5" name="plz"></input>
			</div>
			<div>
				Tragen Sie bitte die Zahlen in das Eingabefeld ein: 
				<span class="obfuscator a">7</span> 
				<span class="obfuscator b">8</span> 
				<span class="obfuscator c">2</span> 
				<span class="obfuscator a">1</span> 
				<span class="obfuscator b">3</span> 
				<span class="obfuscator c">5</span> 
				<input type="text" size="4" maxlength="8" name="code"></input>
			</div>
			<div>thank you for thinking before posting</div>		
			<div id="buttons">
				<!-- input type="submit" value="Abbrechen" -->
				<input type="submit" value="Senden">
				<input type="button" name="cancel" value="Abbrechen" onclick="location.href='forum.jsp?board=<%= board.getKey().getId() %>'">
			</div>
		</form>
	</div>
	
	<%@ include file="_footnote.jsp_" %>
	
	</div>    
    
  </body>
</html>
<% 
	pm.close();		
%>
