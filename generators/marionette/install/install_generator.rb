module Marionette
	module Generators
		class InstallGenerator < Rails::Generators::Base
			include Marionette::Generators::ResourceHelpers

			source_root File.expand_path("../templates", __FILE__)

			# desc "This generator installs backbone.js with a default folder layout in app/assets/javascripts/backbone"

			# class_option :skip_git, :type => :boolean, :aliases => "-G", :default => false,
			#													:desc => "Skip Git ignores and keeps"

			# def inject_backbone
			#		inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
			#			"//= require underscore\n//= require backbone\n//= require backbone_rails_sync\n//= require backbone_datalink\n//= require backbone/#{application_name.underscore}\n"
			#		end
			# end
			#
		
			def append_lib_dependencies
				%w{underscore backbone marionette}.each do |lib|
					append_to_file "app/assets/javascripts/application.js" do
						"\n//= require lib/#{lib}"
					end
				end
			end
			
			def create_dir_layout
				%w{apps config entities views}.each do |dir|
					empty_directory "app/assets/javascripts/backbone/#{dir}"
				end
			end
			
			def append_app_files 
				append_to_file "app/assets/javascripts/application.js" do
					"//= require_tree ./backbone/config\n" +
					"//= require backbone/app\n" +
					"//= require_tree ./backbone/apps\n" +
					"//= require_tree ./backbone/entities\n"
				end
			end
			
			def create_app_file
				@current_user = yes? "Do you need to work with an authenticated current user (y/n)"
				template "app.js.coffee", "app/assets/javascripts/backbone/app.js.coffee"
			end
			
			def start_marionette_app
				append_to_file "app/views/application/index.html.erb" do
					embed_template "index.html.erb"
				end
			end
			
			## TODO: SHOULD ALSO WORK ON APPLICATION.HTML.ERB AND APPEND BEFORE THE END TO START THE DEMO APP + HANDLE CURRENT USER
			
			private
			
			# def inject_current_user
			# 	inject_into_file "app/views/application/index.html.erb" do
			# 		
			# 	end
			# end

		end
	end
end