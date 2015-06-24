# Apptivism Boilerplate

This is the apptivism boilerplate made for Heroku deployment.

In computer programming, boilerplate code or boilerplate is the sections of code that have to be included in many places with little or no alteration. It is often used when referring to languages that are considered verbose, i.e. the programmer must write a lot of code to do minimal jobs.<br/>
- <a href="https://en.wikipedia.org/wiki/Boilerplate_code">From Wikipedia, the free encyclopedia</a>

## What to do with it

Install it and rename it, play with it, reinstall it, build apps with it.

## Installation OSX


### Clone Repository

Open your Terminal, go to your root directory and clone the repo.

```
$ cd
$ git clone https://github.com/apptivism/boilerplate.git
```

### Change to project directory

```
$ cd boilerplate
```

### Install without heroku production gems

```
$ bundle install --without production 
```

### Update Dependencies

```
$ bundle update
```

### Create Database

```
$ bundle exec rake db:migrate
```

### Seed Database 

You should place a default admin in db/seeds.rb before seeding.
The default admin login is:<br/>
Email: admin@example.com<br/>
Password: apptivism<br/>

```
$ bundle exec rake db:seed
```

### Start Local Server

```
$ rails server
```

### Load Boilerplate In Your Browser

At this point you should open your browser and navigate to localhost:3000<br/>
Congratulations! You have installed the boilerplate.


## Entity-Relationship Diagrams

This feature may require installation of Graphviz

```
$ brew install graphviz 
```

To create an entity-relationship diagram:

```
$ rake erd
```
The diagram will appear in the root folder of the application as erd.pdf


## Testing

### Running Tests

The current tests are configured for the boilerplate.<br/>
To execute tests, run the following command in your applications root folder:

```
$ bundle exec rake test
```

### Configuring Tests?

The tests occasionally will test for content such as title tags. For example:

<i>test/controllers/static_pages_controller_test.rb</i>

```ruby
require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home - template" # This line tests for the home pages title tag
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
```

If the title were to change, the test would break. For this reason, configuraton of the tests are necessary.


###