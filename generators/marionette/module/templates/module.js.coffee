@<%= js_app_name %>.module "<%= @module %>", (<%= @module %>, App, Backbone, Marionette, $, _) ->
	<% if @routable %> 
	class <%= @module %>.Router extends Marionette.AppRouter
		appRoutes:
	<% end %>
	API =

	<% if @routable %>
	App.addInitializer ->
		new <%= @module %>.Router
			controller: API
	<% end %>