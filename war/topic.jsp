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

		<div id="pagehead">
			<%@ include file="_pagehead.jsp" %>
		</div>
		
		<div id="Menu">
			<%@ include file="_menue_navigation.jsp" %>
			<%@ include file="_menue_search.jsp" %>
			<%@ include file="_menue_moderatoren.jsp" %>
			<%@ include file="_menue_admin.jsp" %>
		</div>

<div id="Inhalt">

	<a class="navigation" href="#neuePosts">Zu den neuen Beiträgen</a>

	<h2>Problem rendering tikz-qtree output</h2>

	<div id="post">
		<div id="header"><a name=""><h5>Kristian Gärtner schrieb am 12. Oktober 2010 um 12:48 Uhr:</h5></a></div>
		<div id="content">
			<p>Hi,</p>
			<p>tikz-qtree is a TeX package that generates syntactic trees. All other PDF viewers I&#39;ve tried have no problem rendering these trees, but Sumatra v1.1 makes a mess of them.</p>
			<p>This is how they should look (rendered by Foxit Reader):</p>
			<p><a href="http://www.google.de/blabla" rel="nofollow">http://bit.ly/cTaJwm</a></p>
			<p>but instead, Sumatra produces this:</p>
			<p><a href="http://www.google.de/blabla)" rel="nofollow">http://bit.ly/bw9yBc</a></p>
			<p>Any idea why?</p>
			<p>Cheers,<br />
			KG</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>
	
	<div id="post">
		<div id="header"><a name=""><h5>Kristian Gärtner schrieb am 12. Oktober 2010 um 12:50 Uhr:</h5></a></div>
		<div id="content">
			<p>Update: I&#39;ve tried Sumatra 2.2 pre-release, and the problem persists.</p>
			<p>KG</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>
	
	<div id="post">
		<div id="header"><a name=""><h5>Ute Zweig schrieb am 12. Oktober 2010 um 14:20 Uhr:</h5></a></div>
		<div id="content">
			<p>Thanks for the report. It&#39;d be great if you could also upload the PDF document itself so that we investigate what might be the issue.</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>
	
	<div id="post">
		<div id="header"><a name=""><h5>Kristian Gärtner schrieb am 12. Oktober 2010 um 14:53 Uhr:</h5></a></div>
		<div id="content">
			<p>The LaTeX code to produce the tree is:</p>
			<pre>\documentclass{article}
	
\usepackage{tikz,tikz-qtree}

\begin{document}

\Tree [.S [.NP [.Det the ] [.N cat ] ]
[.VP [.V sat ]
[.PP [.P on ]
[.NP [.Det the ] [.N mat ] ] ] ] ]

\end{document}</pre>
			<p>The PDF is here:</p>
			<p><a href="http://www.google.de" rel="nofollow">http://bit.ly/alonfC</a></p>
			<p>Cheers,<br />
			KG</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>
	
	<div id="post">
		<div id="header"><a name=""><h5>Ute Zweig schrieb am 12. Oktober 2010 um 15:02 Uhr:</h5></a></div>
		<div id="content">
			<p>Thanks for the document. I&#39;ve opened <a href="http://www.google.de" rel="nofollow">http://code.google.com/p/issues/detail?id=1063</a> for tracking your issue.</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>
	<h6><a name="neuePosts">Neue Beiträge:</a></h6>
	<div id="post">
		<div id="header"><a name=""><h5><!-- a name="neuePosts"></a -->Ute Zweig schrieb gestern um 15:21 Uhr:</h5></a></div>
		<div id="content">
			<p>FYI: The next prerelease build should correctly render your document.</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>
	
	<div id="post">
		<div id="header"><a name=""><h5>Kristian Gärtner schrieb heute um 17:02 Uhr:</h5></a></div>
		<div id="content">
			<p>Great, thanks!</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div>

	<!-- div id="post">
		<div id="header"><a name=""><h5><a name="neuePosts">NEU:</a> ...</h5></a></div>
		<div id="content">
			<p>...</p>
		</div>
		<div id="footer"><a href="/topic?id=1183321#1184321" title="Permalink" onmouseover="rolloverOn('link', 1184321);" onmouseout="rolloverOff();"><img align="right" id="link1184321" src="/img/icon-anker.gif" alt="Permalink" border="0" height="16" width="16"></a></div>
	</div -->
	<div id="buttons">
		<!-- input type="button" name="Name" value="Neue Antwort erstellen" onclick="Aktion" -->
		<form action="/newComment.jsp" method="link">
		<input type="submit" value="Kommentar hinzufügen">
		</form>
	</div>
	
</div>

<%@ include file="_footnote.jsp" %>

</div>
</body>
</html>