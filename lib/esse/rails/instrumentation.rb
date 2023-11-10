# frozen_string_literal: true

require "esse/rails/instrumentation/runtime_registry"
require "esse/rails/instrumentation/controller_runtime"

ActiveSupport.on_load(:action_controller) do
  include Esse::Rails::Instrumentation::ControllerRuntime
end
