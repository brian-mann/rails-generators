do (Marionette) ->
	_.extend Marionette.Renderer,
		
		lookups: ["backbone/apps/", "backbone/components/"]
		
		render: (template, data) ->
			path = @getTemplate(template)
			throw "Template #{template} not found!" unless path
			path(data)
		
		getTemplate: (template) ->
			for lookup in @lookups
			  ## inserts the template at the '-1' position of the template array
			  ## this allows to omit the word 'templates' from the view but still 
			  ## store the templates in a directory outside of the view
			  ## example: "users/list/layout" will become "users/list/templates/layout"
			  template_directory = template.split("/").splice(-1, 0, "templates")
			  
			  for path in [template, template_directory.join("/")]
				  return JST[path] if JST[path]