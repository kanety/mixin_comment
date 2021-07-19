# frozen_string_literal: true

module MixinComment
  class Loader
    def initialize(dirs)
      @dirs = Array(dirs)
    end

    def call
      load
      load_rails if defined? Rails
    end

    private

    def load
      Dir[@dirs.map { |dir| "#{dir}/**/*.rb" }.join(',')].each do |path|
        full_path = path
        full_path = File.join(Dir.pwd, full_path) unless path.start_with?('/')
        require full_path
      end
    end

    def load_rails
      Rails.application.eager_load!
      ActiveRecord::Base.descendants.each(&:define_attribute_methods)
    end
  end
end
