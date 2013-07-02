@<%= js_application_name %>.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

	class Controllers.Base extends Marionette.Controller

		constructor: (options = {}) ->
			@region = options.region or App.request "default:region"
			super options

		close: (args...) ->
			delete @region
			delete @options

		show: (view) ->
			@listenTo view, "close", @close
			@region.show view