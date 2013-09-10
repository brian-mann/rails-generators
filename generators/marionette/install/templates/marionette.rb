<%= rails_application_name %>::Application.configure do
  config.marionette = {}

  ## client side marionette application instance name
  config.marionette[:app_name] = '<%= suggested_app_name %>'
end