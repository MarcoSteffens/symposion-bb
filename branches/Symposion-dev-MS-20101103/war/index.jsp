<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.appspot.symposionbb.model.Forum" %>
<%@ page import="com.appspot.symposionbb.model.Board" %>
<%@ page import="com.appspot.symposionbb.model.Thread" %>
<%@ page import="com.appspot.symposionbb.PMF" %>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();

	String query = "select from " + Forum.class.getName();
	List<Forum> forum = (List<Forum>) pm.newQuery(query).execute();

 	if (forum.isEmpty()) {
		response.sendRedirect("/init.jsp");
	} else {
		response.sendRedirect("/forum.jsp");
	}

    pm.close();
%>
