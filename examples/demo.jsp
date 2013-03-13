<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--
// Cross-Browser Rich Text Editor
// Written by Kevin Roth (http://www.kevinroth.com/rte/)
// License: http://creativecommons.org/licenses/by/2.5/
//-->
<html>
<head>
	<title>Cross-Browser Rich Text Editor (RTE)</title>
	<!-- Metadata generated by http://vancouver-webpages.com/META/mk-metas.html -->
	<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">
	<META NAME="keywords" CONTENT="cross-browser rich text editor, rte, textarea, htmlarea, content management, cms, blog, internet explorer, firefox, safari, opera, netscape, konqueror">
	<META NAME="description" CONTENT="The cross-browser rich-text editor (RTE) is based on the designMode() functionality introduced in Internet Explorer 5, and implemented in Mozilla 1.3+ using the Mozilla Rich Text Editing API.">
	<META NAME="author" CONTENT="Kevin Roth">
	<META NAME="ROBOTS" CONTENT="ALL">
	<!-- html2xhtml.js written by Jacob Lee <letsgolee@lycos.co.kr> //-->
	<script language="JavaScript" type="text/javascript" src="../cbrte/html2xhtml.min.js"></script>
	<script language="JavaScript" type="text/javascript" src="../cbrte/richtext.min.js"></script>
</head>
<body>

<h2>Cross-Browser Rich Text Editor (RTE) Demo</h2>
<p>For more information, visit the <a href="http://www.kevinroth.com/rte/">Cross-Browser Rich Text Editor (RTE) home page</a>.</p>

<!-- START Demo Code -->
<form name="RTEDemo" action="demo.jsp" method="post" onsubmit="return submitForm();">
<script language="JavaScript" type="text/javascript">
<!--
function submitForm() {
	//make sure hidden and iframe values are in sync for all rtes before submitting form
	updateRTEs();
	
	return true;
}

//Usage: initRTE(imagesPath, includesPath, cssFile, genXHTML, encHTML)
initRTE("../cbrte/images/", "../cbrte/", "", true);
//-->
</script>
<noscript><p><b>Javascript must be enabled to use this form.</b></p></noscript>

<script language="JavaScript" type="text/javascript">
<!--
//build new richTextEditor
var rte1 = new richTextEditor('rte1');
<%
//format content for preloading
String rte1 = "";
if (request.getParameter("rte1") != null) rte1 = request.getParameter("rte1");
if (rte1 == "") {
	rte1 = "here's the " + (char)13 + "\"preloaded <b>content</b>\"";
	rte1 = rteSafe(rte1);
} else {
	//retrieve posted value
	rte1 = rteSafe(rte1);
}
%>
rte1.html = '<%=rte1%>';
//rte1.toggleSrc = false;
rte1.build();
//-->
</script>
<p><input type="submit" name="submit" value="Submit"></p>
</form>
<%!
public static String rteSafe(String strText) {
	//returns safe code for preloading in the RTE
	String tmpString = strText;
	
	//convert all types of single quotes
	tmpString = tmpString.replace((char)145, (char)39);
	tmpString = tmpString.replace((char)146, (char)39);
	tmpString = tmpString.replace("'", "&#39;");
	
	//convert all types of double quotes
	tmpString = tmpString.replace((char)147, (char)34);
	tmpString = tmpString.replace((char)148, (char)34);
//	tmpString = tmpString.replace("\"", "\"");
	
	//replace carriage returns & line feeds
	tmpString = tmpString.replace((char)10, (char)32);
	tmpString = tmpString.replace((char)13, (char)32);
	
	return tmpString;
}
%>
<!-- END Demo Code -->

</body>
</html>
