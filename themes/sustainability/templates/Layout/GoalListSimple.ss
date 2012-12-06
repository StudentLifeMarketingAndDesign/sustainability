<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>Vision 2020 - The University of Iowa&#39;s Sustainability Targets - Sustainability at Iowa - The University of Iowa</title> 
<meta name="generator" content="SilverStripe - http://silverstripe.org" /> 
<meta http-equiv="Content-type" content="text/html; charset=utf-8" /> 
<base href="http://sustainability.uiowa.edu/" /> 

<link rel="stylesheet" type="text/css" href="themes/sustainability/css/styles.css" /> 
<link rel="stylesheet" type="text/css" href="themes/sustainability/css/reset.css" /> 
<link rel="stylesheet" type="text/css" href="themes/sustainability/css/shadowbox.css" /> 
<link href="$ThemeDir/css/goals.css" rel="stylesheet" />
<link rel="stylesheet" href="themes/sustainability/css/ui.css" type="text/css" media="print, projection, screen"/> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script> 
<script type="text/javascript" src="http://sustainability.uiowa.edu//mysite/code/javascript/shadowbox.js"></script> 
<script type="text/javascript"> 
Shadowbox.init();
</script> 
<script type="text/javascript" src="http://imu.uiowa.edu/themes/imu4/javascript/topup/javascripts/top_up-min.js"></script> 
<script type="text/javascript"> 
TopUp.host = "http://imu.uiowa.edu/";
TopUp.images_path = "themes/imu4/javascript/topup/images/top_up/";
TopUp.players_path = "themes/imu4/javascript/topup/players/";
function hideTopUp() {
  TopUp.close();
}
$(document).ready(function leaveFrame() {
  if (window!=window.top) {
	var str = String(window.location.href);
    if (str.indexOf("feedback/finished") > 0) {
      window.location = "http://imu.uiowa.edu/feedback-small-thanks";
	}
  }
});
</script>
<script type="text/javascript" src="http://sustainability.uiowa.edu//mysite/code/javascript/hoverIntent.js"></script> 
<script type="text/javascript" src="http://sustainability.uiowa.edu//mysite/code/javascript/superfish.js"></script> 
<script type="text/javascript">
    $(document).ready(function(){   
        jQuery('ul.sf-menu').superfish();
    });
</script>
<!--[if IE 6]><style type='text/css'>@import url(themes/sustainability/css/ie6.css);</style><![endif]--> 
<!--[if IE 7]><style type='text/css'>@import url(themes/sustainability/css/ie7.css);</style><![endif]--> 
<link rel="SHORTCUT ICON" href="themes/sustainability/images/favicon.ico" />
</head>
<body>

<div id="goalspace" class="typography">

<h1>$Title</h1>

<% control Children %>
<div id="goal">
<a href="$Link"><h2>$Title</h2></a>
<% control Children %>
	<table>
	<tr>
	<th class="title">$Title</th>
	<th class="number">FY05</th>
	<th class="number">FY06</th>
	<th class="number">FY07</th>
	<th class="number">FY08</th>
	<th class="number">FY09</th>
	</tr>
	<% control Children %>
		<tr>
		<td class="title"><a href="$Link" class="tu_iframe_450x530">$Title</a></td>
		<td class="number">$FY05</td>
		<td class="number">$FY06</td>
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


</body>
</html>
