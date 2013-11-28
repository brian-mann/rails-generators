require 'generators/marionette/resource_helpers'

module Marionette
  module Generators
    class EntityGenerator < Rails::Generators::NamedBase
      include Marionette::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      def create_model
        template "model.js.coffee", model_destination
        create_collection if yes?("Create cooresponding #{model_name.classify.pluralize}Collection for #{model_name.classify} model? (y/n)")
        create_handlers if yes?("Create request handlers? (y/n)")
      end

      private

      def model_name
        file_name.underscore
      end

      def model_destination
        "#{backbone_path}/entities/#{model_name}.js.coffee"
      end

      def create_collection
        append_to_file model_destination do
          embed_template "collection.js.coffee"
        end
      end

      def create_handlers
        append_to_file model_destination do
          embed_template "handlers.js.coffee"
        end
      end

    end
  end
end