@<%= js_application_name %>.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  class Views.CollectionView extends Marionette.CollectionView
    itemViewEventPrefix: "childview"