# Apptivism Boilerplate

This is the apptivism boilerplate made for Heroku deployment.

In computer programming, boilerplate code or boilerplate is the sections of code that have to be included in many places with little or no alteration. It is often used when referring to languages that are considered verbose, i.e. the programmer must write a lot of code to do minimal jobs.<br/>
- <a href="https://en.wikipedia.org/wiki/Boilerplate_code">From Wikipedia, the free encyclopedia</a>

## What to do with it

Install it and rename it, play with it, reinstall it, build apps with it.

## Installation OSX


###Clone Repository

Open your Terminal, go to your root directory and clone the repo.

```
$ cd
$ git clone https://github.com/apptivism/boilerplate.git
```

###Change to project directory

```
$ cd boilerplate
```

###Install without heroku production gems

```
$ bundle install --without production 
```

###Update Dependencies

```
$ bundle update
```

###Create Database

```
$ bundle exec rake db:migrate
```

###Seed Database 

You should place a default admin in db/seeds.rb before seeding.
The default admin login is:<br/>
Email: admin@example.com<br/>
Password: apptivism<br/>

```
$ bundle exec rake db:seed
```

###Start Local Server

```
$ rails server
```

###Load Boilerplate In Your Browser

At this point you should open your browser and navigate to localhost:3000<br/>
Congratulations! You have installed the boilerplate.

