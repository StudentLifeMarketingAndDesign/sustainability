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

<style type="text/css">
#goalitem {
  font-size: 12px;
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
  width: 300px;
}
</style>

<div id="goalitem">
<h1>$Title</h1>
<% loop Parent %>
<% loop Parent %>
	<% loop Parent %><a href="$Link">Vision 2020</a> &gt; <% end_loop %>
	<a href="$Link">$LongName</a> &gt; 
<% end_loop %>
<% end_loop %>
$Title
<br /><br />
<span class="goalitemrow"><span class="year">FY05</span> <span class="num">$FY05</span><div class="clear"></div></span>
<span class="goalitemrow"><span class="year">FY06</span> <span class="num">$FY06</span><div class="clear"></div></span>
<span class="goalitemrow"><span class="year">FY07</span> <span class="num">$FY07</span><div class="clear"></div></span>
<span class="goalitemrow"><span class="year">FY08</span> <span class="num">$FY08</span><div class="clear"></div></span>
<span class="goalitemrow"><span class="year">FY09</span> <span class="num">$FY09</span><div class="clear"></div></span>
<div class="clear"></div>
</div>

<% loop Parent %>
<br /><br /><br />
<a href="$Link">Back</a><br />
<% end_loop %>

$Content
 
$Form


</div>
</div>

<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>


</div><!--/end middle-image div -->
</div><!--/end background graident div -->