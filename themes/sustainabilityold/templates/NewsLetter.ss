<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>$Title</title>
<style type="text/css">
h1{
	font-family: 'Gill Sans', Arial, Helvetica, sans-serif;
	font-size: 26px;
}
h2 {
	font-size: 20px;
}
p,td,div {
	font-size: 13px;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>

<body background="http://sustainability.uiowa.edu/themes/sustainability/images/background-gradient.png" style="font-family: Arial, Helvetica, sans-serif;">
<table width="580" border="0" cellpadding="10">
<tr>
	<td colspan="2">
		<a href="http://sustainability.uiowa.edu"><img src="http://sustainability.uiowa.edu/assets/Newsletter/sslogo.png" alt="The University of Iowa - Sustainability News" border="0" width="580" /></a>
	</td>
</tr>
<tr bgcolor="#4A92A8">
	<td colspan="2"><a href="$MainStoryLink">
	<% s FeatureImage.SetWidth(580) %>
	<img src="$AbsoluteURL" alt="Main Story Image" border="0"/>
	<% end_loop %>
	</a>
	<a href="$MainStoryLink"><font face="Gill Sans, Arial, Helvetica, sans-serif" size="4" color="#FFFFFF" style="text-decoration: none;"><h1>$MainHeader</h1></font></a>
	
	
	<div style="font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #FFF; margin-top:0px;">$Content</div>
	
	
	<br />
<a href="$MainStoryLink" style="text-transform: uppercase; text-decoration: none;"><font face="Arial, Helvetica, sans-serif" size="1" color="#8EA7AE" weight="700">[read more]</font></a></p>

	</td>
</tr>

<!-- sub stories -->

<% if Features %>
<% loop Features %>

<tr>

<table width="580" cellpadding="10">

<tr><td colspan="2"><font face="Gill Sans, Arial, Helvetica, sans-serif" size="5"><a href="$Link" style="color:#000000; text-decoration: none;">$Title</a></font></td></tr>

<tr><td><font face="Arial, Helvetica, sans-serif" weight="lighter" size="2">$Content</font><p align="right"><a href="$Link" style="text-decoration: none;" align="right"><font face="Arial, Helvetica, sans-serif" size="1" color="#804F28" weight="700">[read more]</font></a></p></td>

<% if Image %>

<td valign="top"><p><a href="$Link">
<% loop Image.SetWidth(100) %>
<img src="$AbsoluteURL" style="border: 5px solid #fff;" alt="$Title" align="center" valign="top" width="100">
<% end_loop %>
</a></p></td>

<% end_if %>

</tr>
</table>
</tr>

<% end_loop %>
<% end_if %>

<table width="580" cellpadding="10" bgcolor="#235361">



<tr>

<td bgcolor="#235361" valign="top"><a href="http://sustainability.uiowa.edu"><img src="http://sustainability.uiowa.edu/themes/sustainability/images/newlogofooter.png" alt="Sustainability at Iowa Logo"></a>

<table><tr><td><a href="http://www.facebook.com/pages/The-University-of-Iowa-Office-of-Sustainability/251818755982"><img src="http://sustainability.uiowa.edu/themes/sustainability/images/facebook-wide.gif" border="0" alt="follow us on Facebook!"/></a></td><td><a href="http://twitter.com/#!/UIsustainable"><img src="http://sustainability.uiowa.edu/themes/sustainability/images/twitter-wide.gif" alt="follow us on Twitter"></td></tr></table>

</td>

<td><p><font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
Office of Sustainability<br/>
University of Iowa<br/>
1680 University Capitol Centre<br/>
200 South Clinton St<br/>
Iowa City, IA 52242<br/>
319-335-5516<br/></font>
<a href="mailto:sustainability@uiowa.edu"><font color="#8EA7AE" face="Arial, Helvetica, sans-serif" size="2">sustainability@uiowa.edu</a></font></td>
</tr>

</table>
</table>

</body>
</html>
