# Rails Application Templates / Generators for Marionette Projects

## Using the Application Template

The `marionette-template.rb` is an application template for rails used when creating a new application.

To use this application template, in the terminal type:

`rails new APPNAME -m https://raw.github.com/brian-mann/rails-generators/master/marionette-template.rb`

## What this template does

### Miscellaneous File Cleanup
*Removes default `app/assets/images/rails.png` image
*Removes default `public/index.html` file
*Renames `README.rdoc` to `README.md`

### File Permissions
*chmod's log directory to 0777
*TODO: add db directory

### Routing
*Sets up default route to: `application#index`

### App Views
*Creates `app/views/application` directory
*Creates `app/views/application/index.html.erb` file

### App Stylesheets
*Creates `app/assets/stylesheets/apps` directory
*Creates `app/assets/stylesheets/app/_base.css.scss` file
*Renames `app/assets/stylesheets/application.css` to `application.css.scss`
*Removes `require self` and `require tree .` from `application.css.scss` file
*Imports `twitter/bootstrap` and `apps/_base` SCSS files

### APP Javascripts
*Removes `jquery_ujs` and `require_tree .` from `app/assets/javascripts/application.js` file

### Adds Gems
*thin
*rabl
*oj
*gon
*js-routes
*eco
*compass-rails
*bootstrap-sass-rails

