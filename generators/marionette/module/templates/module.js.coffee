@<%= js_application_name %>.module "<%= @module %>", (<%= @module %>, App, Backbone, Marionette, $, _) ->

	<%- if @routable -%>
	class <%= @module %>.Router extends Marionette.AppRouter
		appRoutes:
		<% actions.each do |action| -%>
	"<%= action %>": "<%= action %>"
		<% end -%>
	<%- end -%>

	API =
		<% actions.each do |action| -%>
<%= action %>: ->
			new <%= @module %>.<%= action.capitalize %>.Controller

		<% end -%>
	<% if @routable %>
	App.addInitializer ->
		new <%= @module %>.Router
			controller: API
	<% end -%>