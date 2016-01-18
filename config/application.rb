require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Aureso
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %W(
      #{config.root}/lib
      #{config.root}/lib/pricing_policies
      #{config.root}/lib/roles
      #{config.root}/lib/values
    )
  end
end
