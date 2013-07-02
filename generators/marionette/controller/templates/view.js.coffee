@<%= js_application_name %>.module "<%= @module %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->
  
  class <%= @controller %>.Layout extends <%= Rails.configuration.marionette[:base_views] ? "App.Views.Layout" : "Marionette.Layout" %>
    template: "<%= file_name %>/<%= @controller.downcase %>/<%= @controller.downcase %>_layout"
		
		regions:
      foo: "#foo-region"