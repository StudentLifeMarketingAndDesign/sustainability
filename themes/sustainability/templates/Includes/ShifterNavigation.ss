<div class="shifter-navigation">
		<div class="mobile-navigation">
			<ul class="">
				<% loop Menu(1) %>
					<li <% if $LinkOrSection = "section" %>class="active"<% end_if %>><a href="$Link" class="link">$MenuTitle</a>
					</li>
				<% end_loop %>
			</ul>
		</div>
		<div class="consistent">
			<a href="{$BaseHref}news-and-events/" class="link highlight">News &amp; Events</a>
			<a href="http://sustainability.uiowa.edu/climatenarrative/" class="link highlight">Climate Narrative Blog</a>
		</div>
		<hr />
		<div class="shifter-address">
			<div class="contain">
				<h3>Sustainability at Iowa</h3>
				<p>1650 University Capitol Centre<br />200 South Clinton St.<br />Iowa City, IA 52242</p>
			</div>
		</div>
		<hr />
		<div class="contact">
			<div>
				<a href="mailgo:sustainability@uiowa.edu" class="link">
					<svg class="icon-envelope"><use xlink:href="#icon-envelope"></use></svg>
					<span>Sustainability@uiowa.edu</span>
				</a>
			</div>
			<div>
				<svg class="icon-phone"><use xlink:href="#icon-phone"></use></svg>
				<span>(319) 335-5516</span>
			</div>
		</div>
	</div>