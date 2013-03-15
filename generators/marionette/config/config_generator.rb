require 'generators/marionette/resource_helpers'

module Marionette
	module Generators
		class ConfigGenerator < Rails::Generators::Base
			include Marionette::Generators::ResourceHelpers
			
			source_root File.expand_path("../templates", __FILE__)
			
			## TODO: ASK WHAT KIND OF CONFIG YOU'D LIKE, RENDERER/APPLICATION/JQUERY/JQUERY UI/ETC/VIEWS

			def create_marionette_renderer
				template "renderer.js.coffee", "#{config_path}/marionette/renderer.js.coffee"
			end

		end
	end
end