require 'generators/marionette/resource_helpers'

module Marionette
	module Generators
		class ControllerGenerator < Rails::Generators::NamedBase
			include Marionette::Generators::ResourceHelpers
			
			source_root File.expand_path("../templates", __FILE__)
			
			argument :actions, :type => :array, :default => [], :banner => "action action"

			# RESERVED_JS_WORDS = %W{ break case catch continue debugger default delete do else finally for function if in instanceof new return switch this throw try typeof var void while with }
			# 
			# def validate_no_reserved_words
			# 	actions.each do |action|
			# 		if RESERVED_JS_WORDS.include? action
			# 			raise Thor::Error,	"The name '#{action}' is reserved by javascript " <<
			# 													"Please choose an alternative action name and run this generator again."
			# 		end
			# 	end
			# end
			
				## TODO: IF YOU HAVE NOT ADDED ANY ACTIONS, IT SHOULD ASK YOU A SERIES OF QUESTIONS TO DECIDE WHAT YOU WANT TO BUILD
				## IE: DO YOU WANT DIALOGS? ARE YOU EDITING ANYTHING? ARE YOU SHOWING ANYTHING? ARE YOU LISTING ANYTHING?
				## LOOK AT MY WEBAPP MODULES AND FIND PATTERNS, IF THERE AREN'T PATTERNS, CREATE THEM!
				## rails g marionette:module users show list edit -> listUsers showUser editUser <- methods -- actually just use |list, show, edit, new/New|
				## or just ask questions to determine stuff if there aren't any actions... that's probably better
			
			## TODO: ASK WHAT SUB MODULES YOU'D LIKE ADDED AS WELL - WHICH COME AFTER THE MODULE - LIKE SCAFFOLDS
			
			def create_controller
				# @routable = actions.length == 0 ? yes?("Should this module be routable? (y/n)") : true ## double check to make sure we don't want this module to be routable
				# @module = module_app_namespace file_name ## should not use this ivar
				template "controller.js.coffee", "#{backbone_path}/apps/#{file_name}/#{file_name}_app.js.coffee"
			end

		end
	end
end