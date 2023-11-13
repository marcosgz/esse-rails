# frozen_string_literal: true

require "active_support/core_ext/module/attr_internal"

module Esse
  module Rails
    module Instrumentation
      # Hooks into ActionController to display search runtime
      #
      # @see https://github.com/rails/rails/blob/master/activerecord/lib/active_record/railties/controller_runtime.rb
      #
      module ControllerRuntime
        extend ActiveSupport::Concern

        module ClassMethods
          def log_process_action(payload)
            messages, esse_runtime = super, payload[:esse_runtime]
            messages << ("Search: %.1fms" % esse_runtime.to_f) if esse_runtime
            messages
          end
        end

        def initialize(*args)
          super(*args)
          self.esse_runtime = nil
        end

        protected

        attr_internal :esse_runtime

        def process_action(action, *args)
          Esse::Rails::Instrumentation::RuntimeRegistry.reset
          super
        end

        def cleanup_view_runtime
          if logger&.info?
            search_rt_before_render = Esse::Rails::Instrumentation::RuntimeRegistry.reset
            self.esse_runtime = (db_runtime || 0) + search_rt_before_render
            runtime = super
            search_rt_after_render = Esse::Rails::Instrumentation::RuntimeRegistry.reset
            self.esse_runtime += search_rt_after_render
            runtime - search_rt_after_render
          else
            super
          end
        end

        def append_info_to_payload(payload)
          super
          payload[:esse_runtime] = (esse_runtime || 0) + Esse::Rails::Instrumentation::RuntimeRegistry.reset
        end
      end
    end
  end
end
