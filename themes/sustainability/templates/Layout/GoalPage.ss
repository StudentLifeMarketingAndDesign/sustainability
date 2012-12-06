<link href="$ThemeDir/css/goals.css" rel="stylesheet" />
<div id="content-wrapper">
<div id="middle-image">

<div id="bodywrap">

<% include Navigation %>

<div class="clear"></div>

</div><!--/end bodywrap div -->

<div id="top-shadow"></div> 
<div id="interior-wrapper">
<div id="main-content-wrapper">

<div id="goalspace" class="typography">
<% if HeaderImage %>
	<div class="image">
	<img src="<% control HeaderImage %><% control SetWidth(316) %> $URL <% end_control %><% end_control %>" alt="$Title"/>
	<% if ImageCaption %><p class="caption">$ImageCaption</p><% end_if %> 
	</div>
<% end_if %>
<h1>$MenuTitle</h1>
<br />
<p><strong>$LongName</strong></p>

$Description

<div id="goal">
<% control Children %>
<table>
	<tr>
	<th class="title">$Title</th>
	<th class="number">FY07</th>
	<th class="number">FY08</th>
	<th class="number">FY09</th>
	</tr>
<% control Children %>
	<tr>
	<td class="title"><a href="$Link" class="tu_iframe_450x530">$Title</a></td>
	<td class="number">$FY07</td>
	<td class="number">$FY08</td>
	<td class="number">$FY09</td>
	</tr>
<% end_control %>
</table>
<% end_control %>
<!--
<ul id="goals">
<li id="headings">
	<span class="title">Title</span>
	<span>FY07</span>
	<span>FY08</span>
	<span>FY09</span>
</li>
<li>
	<span class="title"><a href="$Link">$Title</a></span>
	<span>$FY07</span>
	<span>$FY08</span>
	<span>$FY09</span>
</li>
</ul>
-->
</div>
<% control Parent %>

<br /><br />
<a href="$Link">Back to Index</a><br />
<% end_control %>

$Content
 
$Form


</div>
</div>

<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>


</div><!--/end middle-image div -->
</div><!--/end background graident div -->