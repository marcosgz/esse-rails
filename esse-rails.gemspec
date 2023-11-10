# frozen_string_literal: true

require_relative "lib/esse/rails/version"

Gem::Specification.new do |spec|
  spec.name = "esse-rails"
  spec.version = Esse::Rails::VERSION
  spec.authors = ["Marcos G. Zimmermann"]
  spec.email = ["mgzmaster@gmail.com"]

  spec.summary = "Esse on Rails"
  spec.description = "A Ruby on Rails integration for Esse gem"
  spec.homepage = "https://github.com/marcosgz/esse-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/marcosgz/esse-rails"
  spec.metadata["changelog_uri"] = "https://github.com/marcosgz/esse-rails/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "esse"
  spec.add_dependency "activesupport", ">= 4.2", "< 8"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.14"
  spec.add_development_dependency "yard", "~> 0.9.20"
  spec.add_development_dependency "standard", "~> 1.3"
  spec.add_development_dependency "rubocop", "~> 1.20"
  spec.add_development_dependency "rubocop-performance", "~> 1.11", ">= 1.11.5"
  spec.add_development_dependency "rubocop-rspec", "~> 2.4"
end
