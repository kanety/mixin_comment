# frozen_string_literal: true

require 'rdoc'
require 'active_support/all'

require 'mixin_comment/version'
require 'mixin_comment/part'
require 'mixin_comment/loader'
require 'mixin_comment/parser'
require 'mixin_comment/verifier'
require 'mixin_comment/railtie' if defined?(Rails)

module MixinComment
  class << self
    def verify(dirs)
      parts = Parser.new(dirs).call

      Loader.new(dirs).call

      parts.each do |part|
        Verifier.new(part).call
      end
      parts
    end
  end
end
