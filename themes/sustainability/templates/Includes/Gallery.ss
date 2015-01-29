<% if $GalleryImages %>
	<div class="gallerysection no-print">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h2>$Title Gallery</h2>
					<!-- slick carousel -->
					<div class="gallery-carousel">
						<% loop GalleryImages %>
							<div class="" style="width: {$SetHeight(250).Width}px;height: {$SetHeight(250).Height}px;">
								<a href="$SetRatioSize(800,800).URL" title="$Caption" data-gallery="gallery" class="boxer">
	 								<img src="$SetHeight(250).URL" alt="$Caption">
	 								<% if $Caption %><span class="thumb-caption">$Caption</span><% end_if %>
	 							</a>
	 						</div>
						<% end_loop %>
					</div>
				</div><!-- end .col -->
			</div><!-- end .row -->
		</div><!-- end .container -->
	</div><!-- end .gallery -->
<% end_if %>