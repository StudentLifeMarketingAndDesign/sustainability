<nav role="navigation" class="nav-wrapper no-print">
	<div class="container">
		<ul class="main-nav clearfix">
			<% loop Menu(1) %>
				<li <% if $LinkOrSection = "section" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a>
					<!-- Dropdown Menu -->
					<% if Children %>
						<ul class="dropdown">
						<% loop Children %>
							<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a></li>
						<% end_loop %>
						</ul>
					<% end_if %>
					<!-- end dropdown menu -->
				</li>
			<% end_loop %>
		</ul>
	</div>
</nav>