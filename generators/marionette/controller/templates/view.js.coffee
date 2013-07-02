@<%= js_app_name %>.module "<%= @module %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->
  
  class <%= @controller %>.Layout extends Marionette.Layout
    template: "<%= file_name %>/<%= @controller.downcase %>/<%= @controller.downcase %>_layout"
		
		regions:
      foo: "#foo-region"