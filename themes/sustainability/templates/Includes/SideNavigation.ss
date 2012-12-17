<% if Parent %>
<% loop Level(1) %>
<h3><a href="$Link">$Title</a></h3>
<% end_loop %>
<% else %>
<h3>$Title</h3>
<% end_if %>
<% if Menu(2) %>
	<ul>
		<% loop Menu(2) %>
		<li class="$LinkingMode<% if FirstLast %> $FirstLast<% end_if %>">
			<% if LinkingMode = current %>
				<span class="item selected">$MenuTitle</span>
			<% else %>				
				<a class="item" href="$Link" title="View more on $Title">$MenuTitle</a>
			<% end_if %>
			<% if Children %>
				
					<ul class="sub-navigation">
						<% loop Children %>
						<li class="$LinkingMode<% if FirstLast %> $FirstLast<% end_if %>">
							<% if LinkingMode = current %>
								<span class="item selected">$MenuTitle</span>
							<% else %>
								<a class="item" href="$Link" title="View more on $Title">$MenuTitle</a>
							<% end_if %>
						</li>
						<% end_loop %>
					</ul>
				
			<% end_if %>
		</li>
		<% end_loop %>
	</ul>
<% end_if %>