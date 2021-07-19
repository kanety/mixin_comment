require_relative 'boot'

require 'active_record/railtie'

Bundler.require(*Rails.groups)
require 'mixin_comment'

module Dummy
  class Application < Rails::Application
  end
end
