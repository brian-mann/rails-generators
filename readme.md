# (NOT FINISHED OR DOCUMENTED YET, COME BACK LATER)

# Rails Application Templates / Generators for Marionette

After developing conventions for working with Backbone/Marionette, I wrote my own rails generators and application template.  These remove a lot of unnecessary files, and sets up sensible defaults for working with Backbone/Marionette projects.

## Using the Application Template

The `marionette-template.rb` is an application template used when creating a new rails application.  To use this application template, in the terminal type:

```ruby
rails new APPNAME -m https://raw.github.com/brian-mann/rails-generators/master/marionette-template.rb
```

## What this template does

#### Miscellaneous File Cleanup
* Removes default `app/assets/images/rails.png` image
* Removes default `public/index.html` file
* Renames `README.rdoc` to `README.md`

#### File Permissions
* chmod's log directory to 0777
* TODO: add db directory

#### Routing
* Sets default route to: `application#index`

#### App Views
* Creates `app/views/application` directory
* Creates `app/views/application/index.html.erb` file

#### App Stylesheets
* Creates `app/assets/stylesheets/apps` directory
* Creates `app/assets/stylesheets/app/_base.css.scss` file
* Renames `app/assets/stylesheets/application.css` to `application.css.scss`
* Removes `require self` and `require tree .` from `application.css.scss` file
* Imports `twitter/bootstrap` and `apps/_base` SCSS files

#### APP Javascripts
* Removes `jquery_ujs` and `require_tree .` from `app/assets/javascripts/application.js` file

#### Included Gems
* thin
* rabl
* oj
* gon
* js-routes
* eco
* compass-rails
* bootstrap-sass-rails

### TODO:
* Document additional template actions
* Document entire use of all the generators

## Using the Marionette Generators

#### Install the directories and folder organization used throughout BackboneRails

```ruby
rails g marionette:install
```

This will configure the client side name.


#### Configure Marionette: renderer, base entities, base controller, base views

```ruby
rails g marionette:config
```