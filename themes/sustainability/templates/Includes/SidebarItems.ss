<% if SidebarItems %>
	<% loop $SidebarItems %>
		<div class="sidebaritem <% if $Image %>photo<% end_if %>">
			<% if $Image %>
				<% if $UseExternalLink && $ExternalLink%>
					<a href="$ExternalLink" class="sidebaritem-img" style="background-image: url($Image.URL);">
						<img src="$Image.SetWidth(360).URL" alt="$Title">
					</a>
				<% else_if $Link && not $UseExternalLink %>
					<a href="$Link" class="sidebaritem-img" style="background-image: url($Image.URL);">
						<img src="$Image.SetWidth(360).URL" alt="$Title">
					</a>
				<% else %>
					<div class="sidebaritem-img" style="background-image: url($Image.URL);">
						<img src="$Image.SetWidth(360).URL" alt="$Title" class="sidebaritem-img">
					</div>
				<% end_if %>
				<div class="inner">
					<h3 class="title">$Title</h3>
					$Content
					<% if $UseExternalLink && $ExternalLink%>
						<hr>
						<a href="$ExternalLink" class="morelink">Learn More</a>
					<% else_if $Link %>
						<hr>
						<a href="$Link" class="morelink">Learn More</a>
					<% else %>
					<% end_if %>
				</div>
			<% else %>
				<div class="inner">
					<h3 class="title">$Title</h3>
					$Content
					<% if $UseExternalLink && $ExternalLink%>
						<hr>
						<a href="$ExternalLink" class="morelink">Learn More</a>
					<% else_if $Link %>
						<hr>
						<a href="$Link" class="morelink">Learn More</a>
					<% else %>
					<% end_if %>
				</div>
			<% end_if %>
		</div>
	<% end_loop %>
<% end_if %>
