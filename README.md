# esse-rails
 Ruby on Rails extensions for [esse](https://github.com/marcosgz/esse) elasticsearch/opensearch client

## Documentation

Full guides, Railtie reference, and generator docs are published at **[gems.marcosz.com.br/esse-rails](https://gems.marcosz.com.br/esse-rails/)** — part of the [marcosgz Ruby gem catalogue](https://gems.marcosz.com.br).

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
