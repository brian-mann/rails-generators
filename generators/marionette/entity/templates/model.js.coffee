@<%= js_application_name %>.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.<%= model_name.classify %> extends Entities.Model
    urlRoot: -> <%= Rails.configuration.marionette[:js_routes] ? "Routes.#{model_name.pluralize}_path()" : "'/#{model_name.pluralize}'" %>
