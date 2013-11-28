require 'generators/marionette/resource_helpers'

module Marionette
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      include Marionette::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      ## TODO: ASK WHAT KIND OF CONFIG YOU'D LIKE, RENDERER/APPLICATION/JQUERY/JQUERY UI/ETC/VIEWS

      def create_marionette_renderer
        template "renderer.js.coffee", "#{config_path}/marionette/renderer.js.coffee" if yes?("Override Marionette Renderer? (y/n)")
      end

      def create_base_entities
        if yes?("Create base entities for Models and Collections? (y/n)")
          template "models.js.coffee", "#{backbone_path}/entities/_base/models.js.coffee"
          template "collections.js.coffee", "#{backbone_path}/entities/_base/collections.js.coffee"
        end
      end

      def create_base_controller
        if yes?("Create base controller for Marionette Controllers? (y/n)")
          template "controllers.js.coffee", "#{backbone_path}/controllers/_base_controller.js.coffee"
        end
      end

      def create_base_views
        @base_views = if yes?("Create base views for Marionette View, ItemView, Layout, CollectionView, CompositeView? (y/n)")
          %W{_view itemview layout collectionview compositeview}.each do |view|
            template "views/#{view}.js.coffee", "#{backbone_path}/views/_base/#{view}.js.coffee"
          end
        end
      end

      def configure_js_routes
        ## if the gem 'js-routes' is found in the gemfile add config for js-routes
        @match = File.read("#{destination_root}/Gemfile").include? "js-routes"
        insert_into_file "config/initializers/marionette.rb", before: "end" do
          embed_template "config/js_routes.rb"
        end
      end

      def configure_base_views
        ## if we've configured base_views set this to true
        insert_into_file "config/initializers/marionette.rb", before: "end" do
          embed_template "config/base_views.rb"
        end
      end

    end
  end
end