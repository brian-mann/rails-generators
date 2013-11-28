@<%= js_application_name %>.module "<%= module_name_class %>", (<%= module_name_class %>, App, Backbone, Marionette, $, _) ->

  <%- if @routable -%>
  class <%= module_name_class %>.Router extends Marionette.AppRouter
    appRoutes:
    <% app_routes.each do |key, val| -%>
  "<%= val %>": "<%= key %>"
    <% end -%>
  <%- end -%>

  API =
    <% actions.each do |action| -%>
<%= action %>: ->
      new <%= module_name_class %>.<%= replace_underscore(action).capitalize %>.Controller

    <% end -%>
  <% if @routable %>
  App.addInitializer ->
    new <%= module_name_class %>.Router
      controller: API
  <% else %>
  App.commands.setHandler "some:command", ->

  App.reqres.setHandler "some:request", ->
  <% end -%>