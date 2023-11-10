# esse-rails
 Ruby on Rails extensions for "esse" elasticsearch/opensearch client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'esse-rails'
```

And then execute:

```bash
$ bundle
```

## Instrumentation

Esse::Rails provides instrumentation for Esse search operations. It uses Esse::Events to instrument when a search is performed.

If you are using lograge, you can add the following to your `config/initializers/lograge.rb`:

```ruby
require 'esse/rails/lograge'
```
