<% if Pages %>
	<nav role="navigation" class="breadcrumb no-print">
		<div class="inner">
			<p id="breadcrumblabel" class="breadcrumblabel visuallyhidden">You are here:</p>
			<ol aria-labelledby="breadcrumblabel" class="clearfix">
				<li><a href="$Baseref">Home</a></li>
				<% loop Pages %>
					<% if Last %>
						<li class="active"><strong>$Title.XML</strong></li>
					<% else %>
						<li><a href="$Link">$MenuTitle.XML</a></li>
					<% end_if %>
				<% end_loop %>
			</ol>
		</div>
	</nav>
<% end_if %>