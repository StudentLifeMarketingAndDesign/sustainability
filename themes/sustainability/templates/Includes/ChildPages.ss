<!-- Loop Children -->
<% if $Children %>
	<br />
	<% loop $Children %>
		<section class="child-block <% if $SummaryPhoto %>withphoto<% end_if %>">
			<a href="$Link" class="blocklink">
				<% if $SummaryPhoto %>
					<img src="$SummaryPhoto.CroppedImage(280,250).URL" alt="$Title" class="child-block-img">
				<% end_if %>
				<div class="child-block-content">
					<h3 class="title">$Title</h3>
					<% if $Summary %>
						<p>$Summary.LimitCharacters(120)</p>
						<span class="link">Learn More</span>
					<% else %>
						<p>$Content.LimitCharacters(120)</p>
						<span class="link">Learn More</span>
					<% end_if %>
				</div>
			</a>
		</section>
	<% end_loop %>
<% end_if %>
<!-- end Loop Children -->