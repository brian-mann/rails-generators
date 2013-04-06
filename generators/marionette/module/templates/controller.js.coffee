@<%= js_app_name %>.module "<%= @module %>.<%= @action %>", (<%= @action %>, App, Backbone, Marionette, $, _) ->

	<%= @action %>.Controller = 
	<% unless @clean %>
		# sample: ->
			# sampleView = @getSampleView
			# App.mainRegion.show sampleView

	# getSampleView: ->
		# new <%= @action %>.SampleView
	<% end %>
