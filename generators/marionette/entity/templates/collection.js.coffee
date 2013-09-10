
  class Entities.<%= model_name.classify.pluralize %>Collection extends Entities.Collection
    model: Entities.<%= model_name.classify %>
    url: -> <%= Rails.configuration.marionette[:js_routes] ? "Routes.#{model_name.pluralize}_path()" : "'/#{model_name.pluralize}'" %>
