	<div id="navigation">
		<h2><a name="navigation">Navigation</a></h2>
	
		<ul name="Listenname" id="Navigation">
<%
	for (Board b : boards) {
%>		
			<li><a href="../forum.jsp?forum=<%= ((Long) forum.getKey().getId()).toString() %>&board=<%= ((Long) b.getKey().getId()).toString() %>"><%= b.getTitle() %></a> <%//b.getNote() %></li>
<% } %>
			<li><a href="../faq.jsp"><abbr title="Frequently Ask Questions">F.A.Q.</abbr></a></li>
			<li><a href="../guidelines.jsp">Richtlinien</a> (vor dem Schreiben lesen!)</li>
		</ul>
	</div>
