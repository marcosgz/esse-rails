module Esse
  module Rails
    module Lograge
      # Require the component in your `application.rb` file and enable Lograge:
      #
      #     require 'esse/rails/lograge'
      #
      # You should see the full duration of the request to Elasticsearch as part of each log event:
      #
      #     method=GET path=/search ... status=200 duration=380.89 view=99.64 db=0.00 search=279.37
      #
      # @see https://github.com/roidrage/lograge
      #
      class Railtie < ::Rails::Railtie
        initializer "esse.lograge" do |app|
          config.lograge.custom_options = lambda do |event|
            {search: event.payload[:esse_runtime].to_f.round(2)}
          end
        end
      end
    end
  end
end
