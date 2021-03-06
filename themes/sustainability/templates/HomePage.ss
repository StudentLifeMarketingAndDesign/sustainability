<!DOCTYPE html>
<!--[if lt IE 10]><html lang="en" class="lt-ie10 no-js"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
<% include GoogleTagManagerHead %>
<% base_tag %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="$Content.LimitCharacters(150)">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>$Title | Sustainability at Iowa</title>
<link rel="shortcut icon" href="{$BaseHref}favicon.ico" type="image/x-icon">
<link rel="icon" href="{$BaseHref}favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="{$ThemeDir}/css/master.css">

<!-- Typekit Fonts -->
<% include Typekit %>
<script src="{$ThemeDir}/js/modernizr.js"></script>
<!--[if IE 8]>
  	<script>var IE8 = true;</script>
  	<script src="{$ThemeDir}/js/site.ie8.js"></script>
<![endif]-->
<!--[if IE 9]>
	<script>var IE9 = true;</script>
	<script src="{$ThemeDir}/js/site.ie9.js"></script>
<![endif]-->
<!--[if lt IE 9]>
	 <script src="{$ThemeDir}/js/html5shiv.js"></script>
	 <script src="{$ThemeDir}/js/respond.min.js"></script>
<![endif]-->
</head>
<body class="$ClassName $Level(2).URLSegment shifter">
	<% include GoogleTagManagerBody %>
	<% include Svg %>
	<div class="shifter-page">
		<% include UiowaBar %>
		<% include Header %>
		$Layout
		<% include Footer %>
	</div>

	<!-- Mobile Navigation Slideout -->
	<% include ShifterNavigation %>

	<!-- JS -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="{$ThemeDir}/js/build/production.min.js"></script>

	<!-- Picturefill - http://scottjehl.github.io/picturefill/ -->
	<script>
		// Picture element HTML5 shiv
		document.createElement( "picture" );
	</script>
	<script src="{$ThemeDir}/js/picturefill.min.js" async></script>

</body>
</html>



