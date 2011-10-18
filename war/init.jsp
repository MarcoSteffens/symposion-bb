<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.appspot.symposionbb.model.Forum" %>
<%@ page import="com.appspot.symposionbb.model.Board" %>
<%@ page import="com.appspot.symposionbb.PMF" %>

<html>
  <head>
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
    	response.sendRedirect("/login.jsp");
    }
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Board.class.getName();
    List<Board> boards = (List<Board>) pm.newQuery(query).execute();
    query = "select from " + Forum.class.getName();
    List<Forum> forums = (List<Forum>) pm.newQuery(query).execute();
    if (forums.isEmpty()) {
    	%>
    	<p>Neues Forum anlegen.</p>
    <form action="/init" method="post">
      <div>Name des Forums: <textarea name="forumName" rows="1" cols="60">Symposion BB</textarea></div>
      <div>Beschreibung:<textarea name="forumDescription" rows="1" cols="60">Ein Forum zum testen.</textarea></div>
      <!-- div><textarea name="title" rows="1" cols="60">Ein Board</textarea></div>
      <div><textarea name="note" rows="3" cols="60">Ein Board zum testen.</textarea></div>
      <div><textarea name="order" rows="1" cols="5">0</textarea></div -->
      <div><input type="submit" value="Init" /></div>
    </form>
    	<%
    } else {
    	response.sendRedirect("/error.jsp");
    }
    pm.close();
%>

  </body>
</html>