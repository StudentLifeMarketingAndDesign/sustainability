<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>$Title - Sustainability at Iowa - The University of Iowa</title>
$MetaTags(false)
<% base_tag %>
<link rel="stylesheet" type="text/css" href="$ThemeDir/css/reset.css" />
<style type="text/css">
#padding {
  background: #000;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 12px;
  padding: 0px;
}
#padding2 {
  background: #FFF;
  padding: 5px;
}
#goalspace {
  background: #FFF;
  color: #000;
}
#goalitem {
  float: left;
  font-size: 12px;
  width: 310px;
}
h1 {
  border-bottom: 1px solid #CCC;
  font-family: "Gill Sans",Arial,Helvetica,sans-serif;
  font-size: 24px;
  margin: 0px 0px 5px 0px;
}
#goalitem .year {
  float: left;
  display: block;
  width: 100px;
}
#goalitem .num {
  float: right;
}
#goalitem .goalitemrow {
  border-bottom: 1px solid #EEE;
  display: block;
  font-size: 12px;
  width: 410px;
}
.clear {
  clear: both;
}
a {
  color: #4A92A8;
}
#graph {
  margin: 10px 20px 0px 5px;
}
#supplemental {
  float: right;
  margin: 0px 5px 0px 20px;
}
strong {
  font-weight: bold;
}
</style>
</head>
<body>
<div id="padding">
<div id="padding2">
<div id="goalspace" class="typography">
<h1>$Title</h1>
<!--<div id="supplemental">
<% if SupplementalImage %>
	<img src="<% loop SupplementalImage %><% loop SetWidth(430) %> $URL <% end_loop %><% end_loop %>" alt="$Title"/>
<% end_if %>
</div>-->
$Description
<div class="clear"></div>
<div id="graph">
<% if GraphImage %>
	<img src="<% loop GraphImage %><% loop SetWidth(410) %> $URL <% end_loop %><% end_loop %>" alt="$Title"/>
<% end_if %>
</div>
<div id="goalitem">
<br />
<div class="goalitemrow"><span class="year"><strong>Year</strong></span> <span class="num"><% loop Parent %><strong>$Title</strong><% end_loop %></span><div class="clear"></div></div>
<div class="goalitemrow"><span class="year">FY05</span> <span class="num">$FY05</span><div class="clear"></div></div>
<div class="goalitemrow"><span class="year">FY06</span> <span class="num">$FY06</span><div class="clear"></div></div>
<div class="goalitemrow"><span class="year">FY07</span> <span class="num">$FY07</span><div class="clear"></div></div>
<div class="goalitemrow"><span class="year">FY08</span> <span class="num">$FY08</span><div class="clear"></div></div>
<div class="goalitemrow"><span class="year">FY09</span> <span class="num">$FY09</span><div class="clear"></div></div>
<div class="clear"></div>
</div>

<% loop Parent %>
<div class="clear"></div>
<br />
<a href="#" onclick="javascript: window.parent.hideTopUp();return false;">Close</a><br />
<% end_loop %>

$Content 
$Form

<div class="clear"></div>
</div>
</div>

<div class="clear"></div>
</div></html>