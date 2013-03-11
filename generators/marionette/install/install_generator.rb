module Marionette
	module Generators
		class InstallGenerator < Rails::Generators::NamedBase
			# include Backbone::Generators::ResourceHelpers

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
			
			private
			
			def embed_file(source, indent='')
				IO.read(File.join(self.class.source_root, source)).gsub(/^/, indent)
			end

			def embed_template(source, indent='')
				template = File.join(self.class.source_root, source)
				ERB.new(IO.read(template), nil, '-').result(binding).gsub(/^/, indent)
			end

		end
	end
end