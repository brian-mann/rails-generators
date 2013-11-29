@<%= js_application_name %>.module "<%= module_name_class %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->

  class <%= @controller %>.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new <%= @controller %>.Layout