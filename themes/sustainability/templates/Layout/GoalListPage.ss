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

<h1>$Title</h1>

<% control Children %>
<div id="goal">
<a href="$Link"><h2>$Title</h2></a>
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
</div>


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