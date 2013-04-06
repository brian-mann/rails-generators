require 'generators/marionette/resource_helpers'

module Marionette
	module Generators
		class ModuleGenerator < Rails::Generators::NamedBase
			include Marionette::Generators::ResourceHelpers
			
			source_root File.expand_path("../templates", __FILE__)

                        VALID_TEMPLATES = %W{eco ejs hbs hamlc}
			RESERVED_JS_WORDS = %W{ break case catch continue debugger default delete do else finally for function if in instanceof new return switch this throw try typeof var void while with }

			argument :actions, :type => :array, :default => [], :banner => "action action"
                        class_option :template_style, :type => :string, :optional => true, :default => "eco", :banner => VALID_TEMPLATES, :desc => "Generated template style"
                        class_option :clean, :aliases => ["-c"], :type => :boolean, :default => false, :optional => true, :desc => "Keep generated code clean and minimal"

                        def declare_clean
                          @clean = options[:clean]
                        end

			def validate_no_reserved_words
				actions.each do |action|
					if RESERVED_JS_WORDS.include? action
						raise Thor::Error,	"The name '#{action}' is reserved by javascript " <<
																"Please choose an alternative action name and run this generator again."
					end
				end
			end

                        def validate_template_style
				template_style = options[:template_style]
				raise Thor::Error, "Invalide template style #{template_style}, must be one of #{VALID_TEMPLATES}" unless VALID_TEMPLATES.include? template_style
                        end
			
			## TODO: IF YOU HAVE NOT ADDED ANY ACTIONS, IT SHOULD ASK YOU A SERIES OF QUESTIONS TO DECIDE WHAT YOU WANT TO BUILD
				## IE: DO YOU WANT DIALOGS? ARE YOU EDITING ANYTHING? ARE YOU SHOWING ANYTHING? ARE YOU LISTING ANYTHING?
				## LOOK AT MY WEBAPP MODULES AND FIND PATTERNS, IF THERE AREN'T PATTERNS, CREATE THEM!
				## rails g marionette:module users show list edit -> listUsers showUser editUser <- methods -- actually just use |list, show, edit, new/New|
				## or just ask questions to determine stuff if there aren't any actions... that's probably better
			
			def create_submodules
				actions.each do |action|
					if yes?("Create a submodule for #{action}? (y/N)")
						do_create_submodule(action) 
						( @templated_actions ||= [] ) << action
					end
				end
			end

			
			def create_module
				@routable = actions.length == 0 ? yes?("Should this module be routable? (y/n)") : true ## double check to make sure we don't want this module to be routable
				@module = module_app_namespace file_name ## should not use this ivar
				template "module.js.coffee", "#{backbone_path}/apps/#{file_name}/#{file_name}_app.js.coffee"
			end

                        private
			def do_create_submodule(action_name)
				action_path = "#{backbone_path}/apps/#{file_name}/#{action_name}"
				@module = module_app_namespace file_name
				@action = action_name.capitalize
				@template_style = options[:template_style]

				empty_directory action_path
				empty_directory "#{action_path}/templates"
				template "controller.js.coffee", "#{action_path}/#{action_name}_controller.js.coffee"
				template "view.js.coffee", "#{action_path}/#{action_name}_view.js.coffee"
				template "template.jst.#{@template_style}", "#{action_path}/templates/sample.jst.#{@template_style}" unless @clean
			end

		end
	end
end
