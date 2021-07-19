# frozen_string_literal: true

module MixinComment
  class Verifier
    def initialize(part)
      @part = part
    end

    def call
      included_classes(@part.module_name).each do |klass|
        @part.attributes.each do |attr|
          send("verify_#{@part.label.gsub(' ', '_')}", klass, attr)
        end
      end
    end

    private

    def included_classes(module_name)
      mod = module_name.constantize
      klasses = ObjectSpace.each_object(Class).to_a
      klasses.select { |klass| klass.included_modules.include?(mod) }.sort_by(&:name)
    end

    def verify_required_methods(klass, attr)
      unless klass.method_defined?(attr)
        @part.errors << [klass, attr]
      end
    end

    def verify_required_class_methods(klass, attr)
      unless klass.singleton_class.method_defined?(attr)
        @part.errors << [klass, attr]
      end
    end

    def verify_required_override_methods(klass, attr)
      unless klass.method_defined?(attr, false)
        @part.errors << [klass, attr]
      end
    end

    def verify_required_columns(klass, attr)
      unless klass.column_names.include?(attr)
        @part.errors << [klass, attr]
      end
    end

    def verify_required_associations(klass, attr)
      unless klass.reflect_on_association(attr)
        @part.errors << [klass, attr]
      end
    end
  end
end
