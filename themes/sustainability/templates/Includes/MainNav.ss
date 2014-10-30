<!-- Navigation -->
<nav role="navigation">
	<ul class="mainnav clearfix">
		<% loop Menu(1) %>
			<li <% if $LinkOrSection = "section" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a>
				<% if Children %>
					<ul class="mainnav-drop">
					<% loop Children %>
						<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a></li>
					<% end_loop %>
					</ul>
				<% end_if %>
			</li>
		<% end_loop %>
	</ul>
	<hr>
</nav>