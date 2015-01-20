<% if SidebarItems %>
	<div class="tablet-hide">
		<% loop $SidebarItems %>
			<div class="sidebaritem <% if $Image %>photo<% end_if %>">
				<% if $Image %>
					<% if $Link %>
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
						<% if $Link %>
							<hr>
							<a href="$Link" class="morelink">Learn More</a>
						<% end_if %>
					</div>
				<% else %>
					<div class="inner">
						<h3 class="title">$Title</h3>
						$Content
						<% if $Link %>
							<hr>
							<a href="$Link" class="morelink">Learn More</a>
						<% end_if %>
					</div>
				<% end_if %>
			</div>
		<% end_loop %>
	</div>
<% end_if %>
