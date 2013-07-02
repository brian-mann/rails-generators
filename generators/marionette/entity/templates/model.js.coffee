@<%= js_app_name %>.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.<%= model_name.classify %> extends Entities.Model
		urlRoot: -> Routes.<%= model_name.pluralize %>_path()
