@<%= js_app_name %>.module "<%= @module %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->
  
  class <%= @controller %>.Controller extends App.Controllers.Base
    
    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
      
      @show @layout
    
    getLayoutView: ->
      new <%= @controller %>.Layout