require 'generators/marionette/resource_helpers'

module Marionette
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Marionette::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      # desc "This generator installs backbone.js with a default folder layout in app/assets/javascripts/backbone"
      class_option :config, :type => :boolean, :default => true, :description => "Invokes Marionette Base Configuration"

      def name_your_javascript_app
        if no? "The default marionette application name is: #{suggested_app_name} -- Is this ok? (y/n)"
          @app_name = ask("What would you like to name your Marionette Application?").camelize
        end

        ## create the marionette initializer to store the state of our application and configuration
        template "marionette.rb", "config/initializers/marionette.rb"
        Rails.configuration.marionette = { app_name: "#{suggested_app_name}" } ## must do this for the initial app_name to be picked up
      end

      ## gets each of the external libs and places them in the lib directory
      def get_vendor_dependencies
        external_libs.each do |name, lib|
          get lib, "vendor/assets/javascripts/#{name}.js"
        end
      end

      ## appends each of the lib dependencies in applications.js in the correct order
      def append_vendor_dependencies
        %w{underscore backbone marionette}.each do |lib|
          append_to_file "#{javascript_path}/application.js" do
            "\n//= require #{lib}"
          end
        end
        append_to_file "#{javascript_path}/application.js" do
          "\n//= require_tree ../../../vendor/assets/javascripts"
        end
      end

      def create_dir_layout
        %w{apps config entities views components controllers}.each do |dir|
          empty_directory "#{javascript_path}/backbone/#{dir}"
        end
      end

      def append_app_files
        append_to_file "#{javascript_path}/application.js" do
          "\n//= require_tree ./backbone/config\n" +
          "//= require backbone/app\n" +
          "//= require_tree ./backbone/controllers\n" +
          "//= require_tree ./backbone/entities\n" +
          "//= require_tree ./backbone/views\n" +
          "//= require_tree ./backbone/components\n" +
          "//= require_tree ./backbone/apps\n"
        end
      end

      def create_app_file
        @current_user = yes? "Do you need to work with an authenticated current user (y/n)"
        template "app.js.coffee", "#{javascript_path}/backbone/app.js.coffee"
      end

      ## TODO: SHOULD ASK ABOUT STARTING UP ANY SPECIFIC MODULES

      ## TODO: SHOULD ASK ABOUT DEFAULT ROUTE

      ## TODO: SHOULD ASK ABOUT WHICH REGIONS THE USER WANTS ADDED ON TOP OF MAINREGION

      def start_marionette_app
        destination = "app/views/application/index.html.erb"
        create_file destination unless File.exist? destination
        append_to_file destination do
          embed_template "index.html.erb"
        end
      end

      def invoke_config
        generate "marionette:config" if options.config?
      end

      ## TODO: SHOULD ALSO WORK ON APPLICATION.HTML.ERB AND APPEND BEFORE THE END TO START THE DEMO APP + HANDLE CURRENT USER

      private

      def suggested_app_name
        @app_name || rails_application_name
      end

    end
  end
end