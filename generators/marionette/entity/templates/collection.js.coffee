
  class Entities.<%= model_name.classify.pluralize %>Collection extends Entities.Collection
  	model: Entities.<%= model_name.classify %>
  	url: -> Routes.<%= model_name.pluralize %>_path()
