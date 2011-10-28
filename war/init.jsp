<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.appspot.symposionbb.model.Forum" %>
<%@ page import="com.appspot.symposionbb.model.Board" %>
<%@ page import="com.appspot.symposionbb.PMF" %>
<%@ page import="com.appspot.symposionbb.SymposionConsts" %>

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
	<p><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">abmelden</a></p>
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
    	<h1>Neues Forum anlegen.</h1>
    <form action="/init" method="post">
      <div>Name des Forums: <textarea name="forumName" rows="1" cols="60">Symposion BB</textarea></div>
      <div>Beschreibung:<textarea name="forumDescription" rows="1" cols="60">Ein Forum zum testen.</textarea></div>
      <!-- div><textarea name="title" rows="1" cols="60">Ein Board</textarea></div>
      <div><textarea name="note" rows="3" cols="60">Ein Board zum testen.</textarea></div>
      <div><textarea name="order" rows="1" cols="5">0</textarea></div -->
      <h2>Benutzerverwaltung</h2>
  <p>
    <input type="radio" name="userManagement" value="<%= SymposionConsts.USER_MANAGEMENT_NONE %>" checked="checked"> <span style="font-variant:small-caps">Keine</span> Benutzerverwaltung<br />
    <input type="radio" name="userManagement" value="<%= SymposionConsts.USER_MANAGEMENT_GOOGLE %>"> Anmeldung mit dem Google-Konto möglich<br />
    <input type="radio" name="userManagement" value="<%= SymposionConsts.USER_MANAGEMENT_NATIVE %>" disabled="disabled"> Eigene Benutzerverwaltung durch das Forum
    <input type="radio" name="userManagement" value="<%= SymposionConsts.USER_MANAGEMENT_FACEBOOK %>" disabled="disabled"> Anmeldung mit dem Facebook-Konto
    <input type="radio" name="userManagement" value="<%= SymposionConsts.USER_MANAGEMENT_OAUTH %>" disabled="disabled"> Anmeldung mit OAuth
  </p>
      <h2>Berechtigungen</h2>
      <h3>Lesen und Schreiben</h3>
  <p>
    <input type="radio" name="userRights" value="<%= SymposionConsts.USER_RIGHTS_UNRESTRICTED %>" checked="checked"> Jeder darf lesen, jeder darf schreiben<br />
    <input type="radio" name="userRights" value="<%= SymposionConsts.USER_RIGHTS_RESTRICTED %>"> Jeder darf lesen, schreiben nur nach Anmeldung<br />
    <input type="radio" name="userRights" value="<%= SymposionConsts.USER_RIGHTS_CLOSED %>" disabled="disabled"> Lesen und schreiben nur nach Anmeldung
  </p>
      <h3>Löschen</h3>
  <p>
    <input type="checkbox" name="moderationRights" value="<%= SymposionConsts.MODERATION_RIGHTS_ADMIN %>" checked="checked" disabled="disabled"> Jeder darf lesen, jeder darf schreiben<br />
    <input type="checkbox" name="moderationRights" value="<%= SymposionConsts.MODERATION_RIGHTS_MODS %>" disabled="disabled"> Jeder darf lesen, schreiben nur nach Anmeldung<br />
    <input type="checkbox" name="moderationRights" value="<%= SymposionConsts.MODERATION_RIGHTS_AUTHOR %> disabled="disabled"> Lesen und schreiben nur nach Anmeldung
  </p>
  <!-- 
      <p>Benutzer:</p>
      <div>Vorname: <textarea name="userFirstName" rows="1" cols="60">Marco</textarea></div>
      <div>Nachname: <textarea name="userLastName" rows="1" cols="60">Steffens</textarea></div>
      <div>Username: <textarea name="userUserName" rows="1" cols="60">Marco Steffens</textarea></div>
      <div>Passwort: <textarea name="userPassword" rows="1" cols="60">testuser</textarea></div>
      <div>Passwort (wiederholung): <textarea name="userPasswort2" rows="1" cols="60">testuser</textarea></div>
      <div>Email: <textarea name="userEmail" rows="1" cols="60">marco.steffens@googlemail.com</textarea></div>
      <div>Zeitzone: <textarea name="userTimeZone" rows="1" cols="60">GMT</textarea></div>
       -->
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