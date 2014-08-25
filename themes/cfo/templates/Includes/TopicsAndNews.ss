  		<section class="topics hide-print">
            <div class="container">
                <div class="colgroup">
                    <div class="col-1-2 mod">
                        <h3 class="mod-title">Assessment Reports</h3>
                        <ul class="grid-justify">
                        	<li><a href="/vp-for-student-life/assessment/reports/critical-mass/">Critical MASS</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/healthy-hawk-challenge/">Healthy Hawk Challenge</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/health-iowa-2011-2012-/">Health Iowa</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/implicit-bias-workshop/">Implicit Bias Workshop</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/leadershape-institute/">LeaderShape Institute</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/my-iowa/">My IOWA</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/red-watch-band/">Red Watch Band</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/sds-foundations/">SDS Foundations</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/student-employment/">Student Employment</a></li>
                        	<li><a href="/vp-for-student-life/assessment/reports/tutoring/">Tutoring</a></li>

                        	<!--<% with Page("self-help") %>
	                        	<% loop $Entries('8') %>
	                        		<li><a href="$Link">$MenuTitle</a></li>
	                            <% end_loop %>
                            <% end_with %>
                            -->
                        </ul>
                    </div>
                    <div class="col-1-4 mod mod-news">
                    	<h3 class="mod-title">Initiatives</h3>
				        <ul class="unstyled">
				        	<li><a href="/vp-for-student-life/initiatives/iowa-grow/">Iowa GROW</a></li>
				        	<li><a href="/vp-for-student-life/initiatives/multiculturalism-and-diversity/">Multiculturalism and Diversity</a></li>
				        	<li><a href="/vp-for-student-life/initiatives/collegiate-readership-program/">Collegiate Readership Program</a></li>
				        	<li><a href="/vp-for-student-life/initiatives/uslsp-task-force/">(USLSP) Task Force</a></li>
				        	<li><a href="/vp-for-student-life/initiatives/partnership-for-alcohol-safety/">Partnership for Alcohol Safety</a></li>
				        	
				        </ul>
				        <!--
                    	<% with Page(news) %>
							<% if $Entries %>
						        <h3 class="mod-title">Initiatives</h3>
						        <ul class="unstyled">
						        	<% loop $Entries('3') %>
							        	<li><a href="$Link">$MenuTitle</a>
							        		<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
							        	</li>
						        	<% end_loop %>
						        	<li><a href="$Link">View all News</a></li>
						        </ul>
							<% end_if %>
						<% end_with %>
						-->
                    </div>
                    <div class="col-1-4 mod">
                    	<h3 class="mod-title">For Staff</h3>
				        <ul class="unstyled">
				        	<li><a href="/vp-for-student-life/staff/staff-directory/">Staff Directory</a></li>
				        	<li><a href="/vp-for-student-life/news/tag/staff">News</a></li>
				        	<li><a href="#">Thought Starters</a></li>
				        	<li><a href="/vp-for-student-life/staff/faces-behind-the-scenes/">Faces Behind the Scenes</a></li>
				        </ul>
				        <!--
	                    <% with Page(news) %>
							<% if $Entries('','event') %>
						        <h3 class="mod-title">For Staff</h3>
						        <ul class="unstyled">
						        	<% loop $Entries('3','event') %>
						        		<li><a href="$Link">$MenuTitle</a></li>
						        	<% end_loop %>
						        	<li><a href="{$Link}tag/event">View all Events</a></li>
						        </ul>
							<% end_if %>
						<% end_with %>
						-->
                    </div>
                </div>
            </div>
        </section>
