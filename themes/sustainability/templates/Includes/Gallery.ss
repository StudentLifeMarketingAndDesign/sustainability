<% if $GalleryImages %>
	<% loop GalleryImages %>
		<img src="$FileName" />
		<p>$Caption</p>
	<% end_loop %>
<% end_if %>