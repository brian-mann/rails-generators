require 'generators/marionette/resource_helpers'

module Marionette
	module Generators
		class ModuleGenerator < Rails::Generators::NamedBase
			include Marionette::Generators::ResourceHelpers
			
			source_root File.expand_path("../templates", __FILE__)
			
			## TODO: ASK WHAT SUB MODULES YOU'D LIKE ADDED AS WELL - WHICH COME AFTER THE MODULE - LIKE SCAFFOLDS

			def create_module
				@routable = yes? "Should this module be routable? (y/n)"
				@module = module_app_namespace file_name ## should not use this ivar
				template "module.js.coffee", "#{backbone_path}/apps/#{file_name}/#{file_name}_app.js.coffee"
			end

		end
	end
end