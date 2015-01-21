<% if SelectedTag %>
	<!-- ========= BEGIN SELECTED TAG CONTENT ========= -->
	<div class="container">
		<div class="row">
			<!-- Side Bar -->
			<div class="col-lg-4 col-lg-push-8 sidebar">
				<% include SideNav %>
			</div>

			<!-- Main Content -->
			<div class="col-lg-8 col-lg-pull-4">
				<div class="article">
					<h2 class="cat-heading-title"><% _t('BlogHolder_ss.VIEWINGTAGGED', 'Viewing entries tagged with') %> '$SelectedTag'</h2>
					<!-- Loop News -->
					<div class="newsholder-entries">
						<% loop PaginatedNewsEntries(20) %>
							<div class="newsblock clearfix <% if $Photo %>withphoto<% end_if %>">
								<div class="newsblock-info">
									<h4 class="newsblock-title"><a href="$Link">$Title</a></h4>
									<p>$Content.LimitCharacters(100)</p>
								</div>
							</div>
						<% end_loop %>
					</div>
					<% include NewsPagination %>
				</div>
			</div>
		</div><!-- end .row -->
	</div><!-- END .container -->
<% else %>

<!-- ========= BEGIN FEATURED CONTENT ========= -->
<div class="container">
	<div class="row">
		<!-- Side Bar -->
		<div class="col-lg-4 col-lg-push-8 sidebar">
			<% include SideNav %>
		</div>



		<!-- Main Content -->
		<div class="col-lg-8 col-lg-pull-4">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				$Content
				$Form
				<!-- Loop News -->
				<div class="newsholder-entries">
					<% loop PaginatedNewsEntries %>
						<div class="newsblock clearfix <% if $Photo %>withphoto<% end_if %>">
							<div class="newsblock-info">
								<% if $Photo %>
									<a href="$Link">
										<img src="$Photo.CroppedImage(120,120).URL" alt="$Title" class="right">
									</a>
								<% end_if %>
								<h4 class="newsblock-title"><a href="$Link">$Title</a></h4>
								<p>$Content.LimitCharacters(150)</p>
							</div>
						</div>
					<% end_loop %>
				</div>
				<% include NewsPagination %>
			</div>

			<div class="tablet-show">
				<% include SideBarItems %>
			</div>

			<% if SideBarView %>
				<div id="Sidebar" class="browsebydate tablet-show">
					$SideBarView
				</div>
			<% end_if %>
		</div>
	</div>
</div><!-- end .container -->
<% end_if %>