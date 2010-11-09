<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
       "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	<title>Symposion</title>
	<style type="text/css">
		<!--
		-->
	</style>
</head>
<body>
<div id="Seite">

<div id="init">
		
	<h1>Neues Forum anlegen</h1>

    <form action="/init" method="post">
		<table border="0">
			<tr>
				<td>Titel des Forums:</td>
				<td><input type="text" size="40" maxlength="60" name="title"></td>
			</tr>
			<tr>
				<td>Beschreibung des Forums:</td>
				<td><textarea cols="30" rows="8" name="description"></textarea></td>
			</tr>
			<tr>
				<td>Name eines Boards:</td>
				<td><input type="text" size="40" maxlength="60" name="board"></td>
			</tr>
			<tr>
				<td>Moderator:</td>
				<td>Max Mustermann</td>
			</tr>
		</table>		
		<div align="Center">
			<!-- input type="submit" value="Forum anlegen" / -->
		</div>
    </form>
		
</div>

	<!-- div id="post">
		<div id="header"><a name=""><h5><a name="neuePosts">NEU:</a> ...</h5></a></div>
		<div id="content">
			<p>...</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div -->
	<!-- div id="buttons"><input type="button" name="Abbrechen" value="Abbrechen" onclick="Aktion"><input type="button" name="Senden" value="Senden" onclick="Aktion"></div -->
	<div id="buttons">
		<form action="/forum.jsp" method="link">
			<input type="submit" value="Speichern">
		</form>
	</div>

<%@ include file="_footnote.jsp" %>

</div>
</body>
</html>