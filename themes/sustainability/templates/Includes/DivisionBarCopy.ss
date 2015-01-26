<!-- This file overwrites /division-bar/templates/DivisionBar.ss -->
<div class="division-topbar">
    <div class="wrapper">
        <div class="division-directory clearfix">
            <ul class="division-menu">
                <li class="has-subnav">
                    <a href="#" class="directory-link">Directory Navigation</a>
                    <div class="division-show-hide">
                        <ul class="menu-list">
                            <li><a href="http://studentlife.uiowa.edu/" target="_blank">Division of Student Life</a></li>
                            <li><a href="http://csil.uiowa.edu/" target="_blank">Center for Student Involvement &amp; Leadership</a></li>
                            <li><a href="http://counseling.studentlife.uiowa.edu" target="_blank">Counseling Service</a></li>
                            <li><a href="http://dos.uiowa.edu/" target="_blank">Dean of Students</a></li>
                            <li><a href="http://housing.uiowa.edu/" target="_blank">Housing & Dining</a></li>
                        </ul>
                        <ul class="menu-list">
                            <li><a href="http://imu.uiowa.edu/" target="_blank">Iowa Memorial Union</a></li>
                            <li><a href="http://pickone.uiowa.edu" target="_blank">Pick One</a></li>
                            <li><a href="http://recserv.uiowa.edu" target="_blank">Recreational Services</a></li>
                            <li><a href="http://rvap.org" target="_blank">Rape Victim Advocacy Program</a></li>
                            <li><a href="http://osmrc.uiowa.edu" target="_blank">Sexual Misconduct Response Coordinator</a></li>
                        </ul>
                        <ul class="menu-list">
                            <li><a href="http://www.uiowa.edu/sds/" target="_blank">Student Disability Services</a></li>
                            <li><a href="http://studenthealth.uiowa.edu/" target="_blank">Student Health &amp; Wellness</a></li>
                            <li><a href="http://wrac.uiowa.edu/" target="_blank">Women&rsquo;s Resource &amp; Action Center</a></li>
                            <li><a href="http://vp.studentlife.uiowa.edu" target="_blank">Vice President for Student Life</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div><!-- end .division-directory -->
        <div class="clearfix">
            <a href="http://www.uiowa.edu/" class="uiowa" target="_blank">
                <img src="{$BaseHref}/division-bar/images/division-bar/uiowa.png" alt="The University of Iowa" width="177">
            </a>

            <a href="#" class="directory-toggle" target="_blank">
                <img src="{$BaseHref}/division-bar/images/division-bar/division_studentlife.png" alt="Division of Student Life" width="224">
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
