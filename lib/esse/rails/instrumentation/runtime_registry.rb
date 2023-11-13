# frozen_string_literal: true

module Esse
  module Rails
    module Instrumentation
      # A log subscriber to attach to Elastic/Open Search related events
      #
      # @see https://github.com/rails/rails/blob/master/activerecord/lib/active_record/log_subscriber.rb
      #
      class RuntimeRegistry
        def self.runtime=(value)
          Thread.current["esse_runtime"] = value
        end

        def self.runtime
          Thread.current["esse_runtime"] ||= 0
        end

        def self.reset
          rt, self.runtime = runtime, 0
          rt
        end
      end
    end
  end
end

Esse::Events.__bus__.events.keys.grep(/^elasticsearch/).each do |event_name|
  Esse::Events.subscribe(event_name) do |event|
    Esse::Rails::Instrumentation::RuntimeRegistry.runtime += event[:runtime].to_f
  end
end
