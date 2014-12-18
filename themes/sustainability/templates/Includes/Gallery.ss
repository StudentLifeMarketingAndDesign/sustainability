<% if $GalleryImages %>
	<div class="gallery">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h2>Gallery</h2>
					<!-- Roller -->
					<div class="target">
						<% loop GalleryImages %>
							<div class="roller-item" style="width: {$SetHeight(250).Width}px;height: {$SetHeight(250).Height}px;">
								<a href="$FileName" class="boxer" title="$Caption" data-gallery="gallery">
	 								<img src="$SetHeight(250).URL" alt="">
	 							</a>
	 							<!-- <p>$Caption</p> -->
	 						</div>
						<% end_loop %>
					</div>
				</div><!-- end .col -->
			</div><!-- end .row -->
		</div><!-- end .container -->
	</div><!-- end .gallery -->
<% end_if %>