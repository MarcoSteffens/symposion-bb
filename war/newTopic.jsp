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
			<%@ include file="_pagehead.jsp" %>
		</div>
		
		<div id="Menu">
			<%// @include file="_menue_navigation.jsp" %>
			<%// @include file="_menue_search.jsp" %>
			<%// @include file="_menue_moderatoren.jsp" %>
			<%// @include file="_menue_admin.jsp" %>
			<%// @include file="_menue_accesskey.jsp" %>
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
					<td><input type="text" size="40" maxlength="60" name="topicTitle" value="Neuer Topic"></td>
				</tr>
				<tr>
					<td>Inhalt:</td>
					<td><textarea cols="30" rows="8" name="threadContent">Bla bla bla. Bla bla. Dieser Beitrag wird angehängt an Board <%= board.getKey().getId() %> im Forum <%= forum.getKey().getId() %>.</textarea></td>
				</tr>
				<tr>
					<td>Autor:</td>
					<td><%= user.getNickname() %><input type="hidden" name="threadAuthor" value="<%= user.getNickname() %>"></td>
					<!-- td><input type="text" size="40" maxlength="60" name="threadAuthor" readonly="readonly" value="<%= user.getNickname() %>"></td -->
				</tr>
			</table>		
			<div id="buttons">
				<!-- input type="submit" value="Abbrechen" -->
				<input type="submit" value="Senden">
				<input type="button" name="cancel" value="Abbrechen" onclick="location.href='forum.jsp?forum=<%= forum.getKey().getId() %>&board=<%= board.getKey().getId() %>'">
			</div>
		</form>
	</div>
	
	<%@ include file="_footnote.jsp" %>
	
	</div>    
    
  </body>
</html>
<% 
	pm.close();		
%>
