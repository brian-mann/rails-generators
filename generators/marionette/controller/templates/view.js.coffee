@<%= js_application_name %>.module "<%= module_name_class %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->

  class <%= @controller %>.Layout extends <%= Rails.configuration.marionette[:base_views] ? "App.Views.Layout" : "Marionette.Layout" %>
    template: "<%= view_template_path %>"

    regions:
      fooRegion: "#foo-region"