<div id="Inhalt">

	<!-- a class="inpagenav" accesskey="3" href="#neuePosts">Zu den neuen Beiträgen</a  -->

	<h2><a name="pagecontent_headline"><span class="hide">Thema: </span><%= thread.getTitle() %></a></h2>

<% /* 
			<div id="showNew">Zur Zeit werden alle Beiträge angezeigt. <a href="javascript:toggle();">Nur neue oder geänderte anzeigen.</a></div>
			<div id="showAll">Zur Zeit werden nur neue oder geänderte Beiträge angezeigt. <a href="javascript:toggle();">Alle anzeigen.</a></div>
*/ %>
			<div id="separator"></div>

	<div id="post" name="oldPost" class="test">
		<div id="header"><a name=""><h3><%= thread.getAuthor() %> schrieb <%= fmt.format(thread.getDate()) %>:</h3></a></div>
		<div id="content">
			<p><%= thread.getContent() %></p>
		</div>
		<div id="footer">
			<span><a href="/topic?id=1183321#1184321" title="Kommentar löschen"><img id="link1184321" src="/img/delete.jpg" alt="Kommentar löschen" border="0" height="16" width="16"></a></span>
			<span id="spacer"></span>
			<span><a href="/topic?id=1183321#1184321" title="Permalink"><img id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></span>
		</div>
	</div>
<%
	
	for (Comment comment : replys) {
%>		
	<div id="post" name="oldPost">
		<div id="header"><a name=""><h3><%= comment.getAuthor() %> schrieb <%= fmt.format(comment.getDate()) %>:</h3></a></div>
		<div id="content">
			<p><%= comment.getContent() %></p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>
<% } %>

	<div id="buttons">
		<form action="/newComment.jsp" method="get">
<%
    if (user != null) {
%>					
			<input type="hidden" name="forum" value="<%= forum.getKey().getId() %>">
			<input type="hidden" name="board" value="<%= board.getKey().getId() %>">
			<input type="hidden" name="thread" value="<%= thread.getKey().getId() %>">
			<input type="submit" value="Kommentar hinzufügen">
<% } else { %>
			<input alt="test" type="submit" value="Kommentar hinzufügen" disabled="disabled" /><br />
			Hinweis: Zum kommentieren bitte <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">anmelden</a>.
<% } %>					
		</form>
	</div>
	
</div>