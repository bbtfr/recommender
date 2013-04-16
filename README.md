# Recommender

A product recommend plugin for ruby on rails.

Recommender provides other extensions with:

* restful api for crud
* frontend build with backbone & bootstrap


Installation
------------------------------------------------------------------------------

First, add Recommender to your Gemfile... it hasn't been released to Rubygems yet so we'll grab it from git.

Recommender use backbone, bootstrap for frontend pages, and jbuilder to generate backend json api.
So you also need to add those gems.

```ruby
# Spree 1.3.x
gem 'recommender', :github => 'bbtfr/recommender'

gem 'backbone-on-rails'
gem 'bootstap-sass'

gem 'jbuilder'
```

Run the generators to create the migration files.

```bash
rails g recommender
```


Demo
------------------------------------------------------------------------------

You can easily use the `test/dummy` app as a demo of spree_essential_blog. Just `cd` to where you develop and run:
  
```bash  
git clone git://github.com/bbtfr/recommender.git
cd recommender
bundle install
cd test/dummy
bundle exec rails s
```


License
------------------------------------------------------------------------------

This project rocks and uses MIT-LICENSE.
