<!-- This file overwrites /division-bar/templates/DivisionBar.ss -->
<div class="division-topbar no-print">
	<div class="wrapper">
		<div class="clearfix">
			<a href="http://www.uiowa.edu/" class="uiowa" target="_blank">
				<img src="{$BaseHref}/division-bar/images/division-bar/uiowa.png" alt="The University of Iowa" width="177">
			</a>
			<% if SearchForm %>
				<a href="#" class="search-toggle">Search</a>
			<% end_if %>
		</div>
		<% if SearchForm %>
		<div class="division-search">
		<% with SearchForm %>
			<form $FormAttributes>
				<label for="divisionsearchinput">Search</label>
				<input type="search"  id="divisionsearchinput" placeholder="Search" results="5" name="Search" class="division-search-input">
				<input type="submit" class="division-search-btn" value="search">
			</form>
		<% end_with %>
		</div>
		<% end_if %>
	 </div>
</div>
