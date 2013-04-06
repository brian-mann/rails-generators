@<%= js_app_name %>.module "<%= @module %>", (<%= @module %>, App, Backbone, Marionette, $, _) ->
	<% if @routable -%> 
	class <%= @module %>.Router extends Marionette.AppRouter
		appRoutes:
		<% actions.each do |action| -%>
	"<%= action %>": "<%= action %>"
		<% end -%>
	<% end -%>
	
	API =
        <% @actions.each do |action| %>
		<%= action %>: ->
			<%= "# #{@module}.#{action.capitalize}.Controller.sample()" if @templated_actions.include? action and not @clean %>
        <% end if @routable %>

	<% if @routable %>
	App.addInitializer ->
		new <%= @module %>.Router
			controller: API
	<% end -%>
