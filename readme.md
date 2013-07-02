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

#### Install all the preliminaries

```ruby
rails g marionette:install
```

Installation will do the following:
* Configure the client side application name
* Pull in the latest versions of Backbone / Underscore / Marionette
* Create the initial directory structure for apps / views / components / controllers / mixins / config
* Require the load order and directories via the Asset Pipeline
* Create the Marionette Application instance file: `app.js.coffee`
* Invokes `rails g marionette:config` by default

#### Configure Marionette

```ruby
rails g marionette:config
```

Configuration will do the follow:
* Override Marionette Renderer for JST Eco files
* Create Base Entities for Models and Collections
* Create a Base Controller for automating regions and cleanup
* Create Base Views for view / itemview / layout / collectionview / compositeview

#### Create Marionette Modules

```ruby
rails g marionette:module MODULENAME [controllers]
```

This will create a module_app file and initial directory with corresponding AppRoutes for the passed in controller actions.  This will also automatically generate the controllers, views, and initial layout template.  Use this command to scaffold out your initial app modules.

Example: `rails g marionette:module Users list show` would create:

* __/users__
	* users_app.js.coffee
	* __/list__
		* list_controller.js.coffee
		* list_view.js.coffee
		* __/templates__
			* list_layout.jst.eco
	* __/show__
		* show_controller.js.coffee
		* show_view.js.coffee
		* __/templates__
			* show_layout.jst.eco

#### Create Marionette Controllers

```ruby
rails g marionette:controller MODULENAME [controllers]
```

This creates the same controller/view/template combination as above without creating the initial module_app file.  Use this to add controllers to an existing app module.

#### Create Model / Collection Entities

```ruby
rails g marionette:entity MODELNAME
```

This will create a model, and ask to also create the corresponding collection along with the App.request handlers for returning the instances.