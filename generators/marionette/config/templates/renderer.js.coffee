do (Marionette) ->
  _.extend Marionette.Renderer,

    lookups: ["backbone/apps/", "backbone/components/"]

    render: (template, data) ->
      return if template is false
      path = @getTemplate(template)
      throw "Template #{template} not found!" unless path
      path(data)

    getTemplate: (template) ->
      for lookup in @lookups
        ## inserts the template at the '-1' position of the template array
        ## this allows to omit the word 'templates' from the view but still
        ## store the templates in a directory outside of the view
        ## example: "users/list/layout" will become "users/list/templates/layout"

        for path in [template, @withTemplate(template)]
          return JST[lookup + path] if JST[lookup + path]

    withTemplate: (string) ->
      array = string.split("/")
      array.splice(-1, 0, "templates")
      array.join("/")