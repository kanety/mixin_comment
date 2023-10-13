require_relative 'boot'

require 'active_record/railtie'

Bundler.require(*Rails.groups)
require 'mixin_comment'

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f if config.respond_to?(:load_defaults)
  end
end
