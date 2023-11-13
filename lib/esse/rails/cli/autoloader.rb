# require "rails/app_loader"

# # If we are inside a Rails application this method performs an exec and thus
# # the rest of this script is not run.
# Rails::AppLoader.exec_app

require "esse/cli"

module Esse
  module Rails
    module CLI
      module Autoloader
        def after_initialize
          begin
            env_file = File.expand_path("config/environment.rb", Dir.pwd)
            require env_file if File.exist?(env_file)
          rescue LoadError
            # keep going
          end
          super
        end
      end
    end
  end
end

Esse::CLI::Root.prepend(Esse::Rails::CLI::Autoloader)
