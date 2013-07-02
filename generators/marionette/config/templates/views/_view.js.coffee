@<%= js_app_name %>.module "Views", (Views, App, Backbone, Marionette, $, _) ->
	
	_.extend Marionette.View::,
	
		templateHelpers: ->