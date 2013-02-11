<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>$Title - Sustainability at Iowa - The University of Iowa</title>
$MetaTags(false)
<% base_tag %>

<link rel="stylesheet" type="text/css" href="$ThemeDir/css/reset.css" />
<link rel="stylesheet" type="text/css" href="$ThemeDir/css/styles.css" />
<link rel="stylesheet" type="text/css" href="$ThemeDir/css/shadowbox.css" />

<link rel="stylesheet" href="$ThemeDir/css/ui.css" type="text/css" media="print, projection, screen"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<!--<script src="http://code.jquery.com/jquery-latest.min.js"
        type="text/javascript"></script>-->
        
<script type="text/javascript" src="$BaseHref/mysite/code/javascript/shadowbox.js"></script>
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

<script type="text/javascript" src="$BaseHref/mysite/code/javascript/hoverIntent.js"></script>
<link rel="stylesheet" href="{$ThemeDir}/anythingSlider/anythingslider.css">
<script src="{$ThemeDir}/anythingSlider/jquery.anythingslider.min.js"></script>
<script src="{$ThemeDir}/Slides/source/slides.jquery.js"></script>
<link rel="stylesheet" href="{$ThemeDir}/craftyslide/css/craftyslide.css" />
<script src="{$ThemeDir}/craftyslide/js/craftyslide.js"></script>


<style type="text/css" media="screen">
        .slides_container {
            width:570px;
            height:270px;
        }
        .slides_container div {
            width:570px;
            height:270px;
            display:block;
        }
    </style>
<!--<script type="text/javascript" src="$BaseHref/mysite/code/javascript/superfish.js"></script>
<script type="text/javascript">
    $(document).ready(function(){   
        jQuery('ul.sf-menu').superfish();
    });
</script>-->




<!--[if IE 6]><style type='text/css'>@import url($ThemeDir/css/ie6.css);</style><![endif]-->
<!--[if IE 7]><style type='text/css'>@import url($ThemeDir/css/ie7.css);</style><![endif]-->




<link rel="SHORTCUT ICON" href="$ThemeDir/images/favicon.ico" />


<% if CurrentMember %>

<style type="text/css">
div.edit-box {
  margin: 0;
  font-size: 80% /*smaller*/;
  font-weight: bold;
  line-height: 1.1;
  text-align: center;
  position: fixed;
  top: 2em;
  left: auto;
  width: 8.5em;
  right: 2em;
}
div.edit-box p {
  margin: 0; 
  padding: 0.3em 0.4em;
  font-family: Arial, sans-serif;
  background: #900;
  border: thin outset #900;
  color: white;
}

div.edit-box a, div.edit-box em { display: block; margin: 0 0.5em }
div.edit-box a, div.edit-box em { border-top: 2px groove #900 }
div.edit-box a:first-child { border-top: none }
div.edit-box em { color: #CFC }

div.edit-box a:link { text-decoration: none; color: white }
div.edit-box a:visited { text-decoration: none; color: #CCC }
div.edit-box a:hover { background: black; color: white }
</style>

<% end_if %>

</head>

<body>
         
         

<div class="hidden"><a href="/#bodywrap">Skip to main content</a></div>

<div id="container">
<div id="header-wrapper"> 
<div id="header"> 
 
 <div id="search">
 
<!--<form method="get" action="http://search.uiowa.edu/search">
<input type="text" style="width: 200px; border: 1px solid gray" size="19" title="text"/> 
<input type="image" src="$ThemeDir/images/search.png" alt="search" name="op" id="edit-submit" value="Log in" tabindex="3" class="form-submit" title="submit"/>
<input type="hidden" name="site" value="default_collection" />

<input type="hidden" name="client" value="default_frontend" />
<input type="hidden" name="output" value="xml_no_dtd" />
<input type="hidden" name="proxystylesheet" value="default_frontend" />
<input type="hidden" name="sitesearch" value="sustainability.uiowa.edu" />

</form>-->


<form method="get" action="http://search.uiowa.edu/search">
<input type="text" name="q" size="25" maxlength="256" value="" title="text"  />  
<input type="submit" name="btnG" value="Search" class="submit" />  
<input type="hidden" name="site" value="default_collection" />
<input type="hidden" name="client" value="default_frontend" />
<input type="hidden" name="output" value="xml_no_dtd" />
<input type="hidden" name="proxystylesheet" value="default_frontend" />
<input type="hidden" name="sitesearch" value="sustainability.uiowa.edu" />  
</form>

<!--<form>
<input type="text" style="width: 200px; border: 1px solid gray" /> <input type="submit" class="formbutton" value="Submit" />
</form>
-->
</div>

<a href="http://www.uiowa.edu" target="_blank"><img class="uiowa"  src="$ThemeDir/images/uiowa.png" alt="The University of Iowa" title="The University of Iowa" /></a><div class="clear"></div>
  <h1 class="logo" title="Sustainability at Iowa"> <a href="$BaseHref">Sustainability at Iowa</a></h1>
 
  </div><!--  / header div -->
</div><!--  / header wrapper div -->




  

$Layout

 


<div id="footer-container">    
<div class="footer">
<a href="$BaseHref/content-submission-form"><img src="$ThemeDir/images/contentbutton.png" alt="Send Us Your Content" title="Send Us Your Content" class="submit-content" longdesc="http://sustainability.uiowa.edu" /></a>	
<a href="$BaseHref"><img style="margin-left:-10px;" src="$ThemeDir/images/newlogofooter.png" alt="Sustainability at Iowa" title="Sustainability at Iowa" width="333" height="80" class="logo" longdesc="http://sustainability.uiowa.edu" /></a>

<p class="footer-contact">1680 University Capitol Centre, 200 South Clinton St. • Iowa City, IA 52242 • 319-335-5516  • <a href="mailto:Sustainability@uiowa.edu">Sustainability@uiowa.edu</a></p>


  <ul class="menu">
       <% loop Menu(1) %>
                <li class="$URLSegment"><a href="$Link">$MenuTitle</a>
                  <% if Children %>  <ul>
                        <% loop Children %>
                            <li><a href="$Link">$Title</a></li>
                        <% end_loop %>
                    </ul><% end_if %></li>
            <% end_loop %>
      </ul>
		
<p class="copywright">&copy; <a href="http://www.uiowa.edu/">The University of Iowa</a> $Now.Year. All rights reserved.</p>
</div>
<!--/end footer div --></div></div>
<!--/end container div -->
<% if CurrentMember %>
<div class="edit-box">
<p><a href="$BaseHref/admin/pages/edit/show/{$ID}">Edit this page</a></p>
</div>
<% end_if %>  
    


<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-426753-19");
pageTracker._trackPageview();
} catch(err) {}</script>

</body>
</html>






