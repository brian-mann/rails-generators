remove_file "app/assets/images/rails.png"

remove_file "README.rdoc"
create_file "README.md", "TODO"

run "rm public/index.html"
route("root :to => 'application#index'")

chmod "log", 0777

inside "app/views" do
	empty_directory "application"
	create_file "application/index.html.erb" do
		"foo"
	end
end

inside "app/assets/stylesheets" do
	copy_file "application.css", "application.css.scss"
	remove_file  "application.css"
	
	empty_directory "apps"
	create_file "apps/_base.css.scss"
	
	gsub_file "application.css.scss", /\*= require_(self|tree .)/, ""
	gsub_file "application.css.scss", /(\s\n)/, "" 
	append_to_file "application.css.scss" do
		"\n@import \"twitter/bootstrap\";\n" +
		"\n@import \"apps/_base\";"
	end
end

inside "app/assets/javascripts" do
	gsub_file "application.js", /\/\/= require(_tree .| jquery_ujs\n)/, ""
	gsub_file "application.js", /(\s\n)/, "" 
end

gem 'thin'
if yes? "Do you need to generate JSON? (y/n)"
	gem 'rabl'
	gem 'oj'
	gem 'gon'
end
gem 'js-routes' if yes? "Are you using client side routes? (y/n)"
gem 'jquery-ui-rails' if yes? "Are you using jQuery UI? (y/n)"

gem_group :assets do
  gem 'eco'
	gem 'compass-rails'
	gem 'bootstrap-sass-rails'
end

comment_lines 'config/environments/development.rb', /active_record.mass_assignment_sanitizer/
insert_into_file "app/controllers/application_controller.rb", "\n\tdef index\n\tend\n", :before => "end"

if yes? "Initialize git and commit? (y/n)"
	git :init
	append_file ".gitignore", ".DS_Store\n"
	append_file ".gitignore", "/lib/generators\n" if yes? "Ignore lib/generators? (y/n)"
	git add: "."
	git commit: "-a -m 'Initial commit'"	
end