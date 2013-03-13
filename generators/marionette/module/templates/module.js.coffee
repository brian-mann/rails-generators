@<%= js_app_name %>.module "<%= module_app_namespace %>", (<%= module_app_namespace %>, App, Backbone, Marionette, $, _) ->
	<% if @routable %> 
	class <%= module_app_namespace %>.Router extends Marionette.AppRouter
		appRoutes:
	
	App.addInitializer ->
		new <%= module_app_namespace %>.Router
			controller: API