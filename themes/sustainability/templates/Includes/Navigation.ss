<div id="nav">



   <ul class="sf-menu">
            <% control Menu(1) %>
            
                <li id="$URLSegment" class="$LinkingMode"><a href="$Link" <% if RedirectionType = External %>target="_blank" class="external-link"<% end_if %>>$MenuTitle</a>
                   <% if Children %> <ul>
					
                        <% control Children %>
                            <li class="$LinkingMode"><a href="$Link" <% if RedirectionType = External %> target="_blank" class="external-link"<% end_if %>>$MenuTitle</a></li>
                        <% end_control %>
                    </ul><% end_if %></li>
					
            <% end_control %>
        </ul>
        
        
        
</div>




