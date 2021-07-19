# frozen_string_literal: true

module MixinComment
  class Part
    LABELS = [
      'required methods',
      'required class methods',
      'required override methods',
      'required columns',
      'required associations'
    ]

    attr_accessor :module_name, :label, :attributes
    attr_accessor :errors

    def initialize(module_name, label, attributes)
      @module_name = module_name
      @label = label
      @attributes = attributes
      @errors = []
    end

    def has_errors?
      @errors.present?
    end

    def show_errors
      errors.each do |klass, attr|
        puts "#{klass}##{attr} is #{label.singularize} by #{module_name}"
      end
    end
  end
end
