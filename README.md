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

If you are using [lograge](https://github.com/roidrage/lograge), you can optionally require `esse/rails/lograge` to log search operations:

```ruby
require 'esse/rails/lograge'
```
