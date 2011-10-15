# app_box

The last rails application configuration manager you'll ever need. app_box provides a simple and
yet very powerful structure to configure glonal settings for any Rails application.

## Usage

### Configuration

This is where your configurations goes, consider the following sample box file

    default:
      foo: bar
    development:
      services:
        twitter:
          msgs:
            hello: ya man
          key: '456'
          secret: '789'

### Initializer

Create an initializer under config/initializers ex(app_box.rb) and then add the following line

    # this is a sample code for a Rails 3
    # application
    AppBox.init Rails.env, Rails.root


## TODO
* Write units tests
* Add support to any rack based application
* Refactor the code and write documentation

## Contributing to app_box
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Ahmed El.Hussaini. See LICENSE.txt for
further details.
