module Marionette
  module Generators
    module ResourceHelpers
      # 
      # def model_namespace
      #   [js_app_name, "Models", class_name].join(".")
      # end
      # 
      # def singular_model_name
      #   uncapitalize singular_name.camelize
      # end
      # 
      # def plural_model_name
      #   uncapitalize(plural_name.camelize)
      # end
      # 
      # def collection_namespace
      #   [js_app_name, "Collections", plural_name.camelize].join(".")
      # end
      # 
      # def view_namespace
      #   [js_app_name, "Views", plural_name.camelize].join(".")
      # end
      # 
      # def router_namespace
      #   [js_app_name, "Routers", plural_name.camelize].join(".")
      # end
      # 
      # def jst(action)
      #   "backbone/templates/#{plural_name}/#{action}"
      # end

			def external_libs
				{
					underscore: "http://documentcloud.github.com/underscore/underscore.js",
					backbone: 	"http://documentcloud.github.com/backbone/backbone.js",
					marionette: "http://marionettejs.com/downloads/backbone.marionette.js",
				}
			end

			def javascript_path
				"app/assets/javascripts"
			end
			
			def backbone_path
				"#{javascript_path}/backbone"
			end
			
			def config_path
				"#{backbone_path}/config"
			end
			
			def module_app_namespace name
				name.camelize + "App"
			end

			def embed_file(source, indent='')
				IO.read(File.join(self.class.source_root, source)).gsub(/^/, indent)
			end

			def embed_template(source, indent='')
				template = File.join(self.class.source_root, source)
				ERB.new(IO.read(template), nil, '-').result(binding).gsub(/^/, indent)
			end
      
      def js_app_name
        application_name.camelize
      end
      
      def application_name
        if defined?(Rails) && Rails.application
          Rails.configuration.marionette.app_name rescue rails_application_name
        else
          "app"
        end
      end

			def rails_application_name
				Rails.application.class.name.split('::').first
			end
      
      # def uncapitalize(str)
      #   str[0, 1].downcase << str[1..-1]
      # end
      
    end
  end
end