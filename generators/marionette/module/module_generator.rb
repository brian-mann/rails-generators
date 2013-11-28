require 'generators/marionette/resource_helpers'

module Marionette
  module Generators
    class ModuleGenerator < Rails::Generators::NamedBase
      include Marionette::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      argument :actions, :type => :array, :default => [], :banner => "action action"

      ## TODO: IF YOU HAVE NOT ADDED ANY ACTIONS, IT SHOULD ASK YOU A SERIES OF QUESTIONS TO DECIDE WHAT YOU WANT TO BUILD
      ## IE: DO YOU WANT DIALOGS? ARE YOU EDITING ANYTHING? ARE YOU SHOWING ANYTHING? ARE YOU LISTING ANYTHING?
      ## LOOK AT MY WEBAPP MODULES AND FIND PATTERNS, IF THERE AREN'T PATTERNS, CREATE THEM!
      ## rails g marionette:module users show list edit -> listUsers showUser editUser <- methods -- actually just use |list, show, edit, new/New|
      ## or just ask questions to determine stuff if there aren't any actions... that's probably better

      ## TODO: ASK WHAT SUB MODULES YOU'D LIKE ADDED AS WELL - WHICH COME AFTER THE MODULE - LIKE SCAFFOLDS

      def create_module
        @routable = yes?("Should this module be routable? (y/n)") ## double check to make sure we don't want this module to be routable
        @module = module_name_class ## should not use this ivar
        template "module.js.coffee", "#{backbone_path}/apps/#{module_name_underscore}/#{module_name_underscore}_app.js.coffee"
      end

      def generate_controllers
        generate "marionette:controller", file_name, *actions unless actions.empty?
      end

      private

      def app_routes
        actions.inject({}) do |memo, action|
          memo[action] = lookup(action)
          memo
        end
      end

      def lookup(action)
        {
          list: resource_name,
          _new: resource_name + "/new",
          show: resource_name + "/:id",
          edit: resource_name + "/:id/edit"
        }[action.to_sym] || "change_me"
      end

      def resource_name
        file_name.downcase.pluralize
      end
    end
  end
end