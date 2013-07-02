@<%= js_application_name %>.module "<%= module_name_class %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->

	class <%= @controller %>.Layout extends <%= Rails.configuration.marionette[:base_views] ? "App.Views.Layout" : "Marionette.Layout" %>
		template: "<%= module_name_underscore %>/<%= @controller.downcase %>/<%= @controller.downcase %>_layout"

		regions:
			foo: "#foo-region"