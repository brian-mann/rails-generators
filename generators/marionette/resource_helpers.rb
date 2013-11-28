module Marionette
  module Generators
    module ResourceHelpers

      def external_libs
        {
          underscore: "http://documentcloud.github.com/underscore/underscore.js",
          backbone:   "http://documentcloud.github.com/backbone/backbone.js",
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

      def module_name_class
        file_name.camelize + "App"
      end

      def module_name_underscore
        file_name.underscore
      end

      def embed_file(source, indent='')
        IO.read(File.join(self.class.source_root, source)).gsub(/^/, indent)
      end

      def embed_template(source, indent='')
        template = File.join(self.class.source_root, source)
        ERB.new(IO.read(template), nil, '-').result(binding).gsub(/^/, indent)
      end

      def js_application_name
        Rails.configuration.marionette[:app_name].camelize rescue "App"
      end

      def rails_application_name
        Rails.application.class.name.split('::').first
      end

      def replace_underscore(string)
        string[0] == "_" ? string[1..-1] : string
      end

      # def uncapitalize(str)
      #   str[0, 1].downcase << str[1..-1]
      # end

    end
  end
end