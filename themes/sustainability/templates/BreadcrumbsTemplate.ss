<% if Pages %>
	<nav role="navigation">
		<p class="breadcrumblabel visuallyhidden">You are here:</p>
		<ol class="breadcrumb" aria-labelledby="breadcrumblabel">
			<li><a href="$Baseref">Home</a></li>
			<% loop Pages %>
				<% if Last %>
					<li class="active"><strong>$Title.XML</strong></li>
				<% else %>
					<li><a href="$Link">$MenuTitle.XML</a></li>
				<% end_if %>
			<% end_loop %>
		</ol>
	</nav>
<% end_if %>