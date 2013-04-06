@<%= js_app_name %>.module "<%= @module %>.<%= @action %>", (<%= @action %>, App, Backbone, Marionette, $, _) ->

	<% unless @clean %>
	# class <%= @action %>.SampleView extends Marionnette.ItemView
		# template: "<%= "#{@module}/#{@action}/templates/sample.jst.#{@template_style}" %>"
	<% end %>
