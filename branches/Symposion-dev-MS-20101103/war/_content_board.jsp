		<div id="Inhalt">
			<!-- a class="navigation" href="#neuePosts">Zu den neuen Beitr�gen</a -->
		
			<h2><a id="target" name="pagecontent_headline"><%= board.getTitle() %></a></h2>
			<!-- a href="/topic?id=1183321#1184321" title="Nur neue oder ge�nderte Beitr�ge anzeigen"><img id="link1184321" src="/img/delete.jpg" alt="Hier klicken, um nur neue oder ge�nderte Beitr�ge anzuzeigen." border="0" height="16" width="16"></a -->
<% /* 
			<div id="showNew">Zur Zeit werden alle Beitr�ge angezeigt. <a id="showNewLink" href="javascript:toggle();">Nur neue oder ge�nderte anzeigen.</a></div>
			<div id="showAll">Zur Zeit werden nur neue oder ge�nderte Beitr�ge angezeigt. <a id="showAllLink" href="javascript:toggle();">Alle anzeigen.</a></div>
*/ %>
			<div id="separator"></div>
		
			<div id="topics">
<%
	for (Thread t : threads) {
%>		
				<p name="newPost"><!-- img align="left" id="link1184321" src="/img/pin.jpg" alt="Sticky" border="0" height="16" width="16" / -->
					<a href="../forum.jsp?forum=<%= ((Long) forum.getKey().getId()).toString() %>&board=<%= ((Long) board.getKey().getId()).toString() %>&thread=<%= ((Long) t.getKey().getId()).toString() %>"><%= t.getTitle() %></a><span class="hide">. </span>
					<em><%= t.getAuthor() %></em><span>(<%= t.getReply().size() %> Kommentare)</span></p>
<% } %>
			</div>
			
			<div id="separator"></div>
			
			<!-- div id="buttons"><input type="button" name="Name" value="Neues Thema erstellen" onclick="Aktion"></div -->
			<div id="buttons">
				<form action="/newTopic.jsp" method="get">
<%
    if (user != null) {
%>					
					<input type="hidden" name="forum" value="<%= forum.getKey().getId() %>">
					<input type="hidden" name="board" value="<%= board.getKey().getId() %>">
					<!-- input type="hidden" name="threadKey" value="<% //thread.getKey(); %>" -->
					<input type="submit" value="Neues Thema hinzuf�gen">
<% } else { %>
					<input alt="test" type="submit" value="Neues Thema hinzuf�gen" disabled="disabled" /><br />
					Hinweis: Zum Schreiben bitte <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">anmelden</a>.
<% } %>					
				</form>
			</div>
		</div>