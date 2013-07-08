@<%= js_application_name %>.module "<%= module_name_class %>", (<%= module_name_class %>, App, Backbone, Marionette, $, _) ->

	<%- if @routable -%>
	class <%= module_name_class %>.Router extends Marionette.AppRouter
		appRoutes:
		<% actions.each do |action| -%>
	"<%= action %>": "<%= action %>"
		<% end -%>
	<%- end -%>

	API =
		<% actions.each do |action| -%>
<%= action %>: ->
			new <%= module_name_class %>.<%= action.capitalize %>.Controller

		<% end -%>
	<% if @routable %>
	App.addInitializer ->
		new <%= module_name_class %>.Router
			controller: API
	<% else %>
	App.commands.setHandler "some:command", ->
	
	App.reqres.setHandler "some:request", ->
	<% end -%>