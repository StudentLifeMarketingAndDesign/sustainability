<div id="nav">



   <ul class="sf-menu">
            <% loop Menu(1) %>
            
                <li id="$URLSegment" class="$LinkingMode"><a href="$Link" <% if RedirectionType = External %>target="_blank" class="external-link"<% end_if %>>$MenuTitle</a>
                   <% if Children %> <ul>
					
                        <% loop Children %>
                            <li class="$LinkingMode"><a href="$Link" <% if RedirectionType = External %> target="_blank" class="external-link"<% end_if %>>$MenuTitle</a></li>
                        <% end_loop %>
                    </ul><% end_if %></li>
					
            <% end_loop %>
        </ul>
        
        
        
</div>




