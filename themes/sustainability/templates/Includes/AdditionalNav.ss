<div class="subnavigation">

<% if Menu(4) %>
	<nav class="block current">
		<h2>This Section</h2>
		<% with Level(3) %>
			<% if $LinkOrCurrent = "current" %>
				<h4 class="active">$MenuTitle</h4>
			<% else %>
				<h4><a href="$Link">$MenuTitle</a></h4>
			<% end_if %>
		<% end_with %>
		<ul class="first-level">
			<% loop Menu(4) %>
				<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a>
					<% if $LinkOrSection = "section" && Children %>
						<ul class="second-level">
							<% loop Children %>
								<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>>
									<a href="$Link">$MenuTitle</a>
									<% if $LinkOrSection = "section" && Children %>
										<ul class="third-level">
											<% loop Children %>
												<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>>
													<a href="$Link">$MenuTitle</a>
												</li>
											<% end_loop %>
										</ul>
									<% end_if %>
								</li>
							<% end_loop %>
						</ul>
					<% end_if %>
				</li>
			<% end_loop %>
		</ul>
	</nav>
<% else_if Menu(3) %>
	<nav class="block current">
		<h2>This Section</h2>
		<% with Level(2) %>
			<% if $LinkOrCurrent = "current" %>
				<h4 class="active">$MenuTitle</h4>
			<% else %>
				<h4><a href="$Link">$MenuTitle</a></h4>
			<% end_if %>
		<% end_with %>
		<ul class="first-level">
			<% loop Menu(3) %>
				<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a>
					<% if $LinkOrSection = "section" && Children %>
						<ul class="second-level">
							<% loop Children %>
								<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>>
									<a href="$Link">$MenuTitle</a>
									<% if $LinkOrSection = "section" && Children %>
										<ul class="third-level">
											<% loop Children %>
												<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>>
													<a href="$Link">$MenuTitle</a>
												</li>
											<% end_loop %>
										</ul>
									<% end_if %>
								</li>
							<% end_loop %>
						</ul>
					<% end_if %>
				</li>
			<% end_loop %>
		</ul>
	</nav>
<% end_if %>


<% if Menu(3) %>
	<nav class="block siblings">
		<h2>Related Sections</h2>
		<ul class="first-level">
			<% loop Menu(2) %>
				<li><a href="$Link">$MenuTitle</a></li>
			<% end_loop %>
		</ul>
	</nav>
<% else %>
	<nav class="block siblings">
		<h2>This Section</h2>
		<% with Level(1) %>
			<% if $LinkOrCurrent = "current" %>
				<h4 class="active">$MenuTitle</h4>
			<% else %>
				<h4><a href="$Link">$MenuTitle</a></h4>
			<% end_if %>
		<% end_with %>
		<ul class="first-level">
			<% loop Menu(2) %>
				<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a></li>
			<% end_loop %>
		</ul>
	</nav>
<% end_if %>


</div><!-- end .subnavigation -->









