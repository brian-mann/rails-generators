
  API =
    get<%= model_name.classify.pluralize %>: ->
      <%= model_name.pluralize %> = new Entities.<%= model_name.classify.pluralize %>Collection
      <%= model_name.pluralize %>.fetch
        reset: true
      <%= model_name.pluralize %>

    get<%= model_name.classify %>: (id) ->
      <%= model_name %> = new Entities.<%= model_name.classify %>
        id: id
      <%= model_name %>.fetch()
      <%= model_name %>

    new<%= model_name.classify %>: ->
      new Entities.<%= model_name.classify %>

  App.reqres.setHandler "<%= model_name %>:entities", ->
    API.get<%= model_name.classify.pluralize %>()

  App.reqres.setHandler "<%= model_name %>:entity", (id) ->
    API.get<%= model_name.classify %> id

  App.reqres.setHandler "new:<%= model_name %>:entity", ->
    API.new<%= model_name.classify %>()