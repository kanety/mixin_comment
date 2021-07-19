# frozen_string_literal: true

module MixinComment
  class Parser
    def initialize(dirs)
      @dirs = Array(dirs)
      @parts = []
    end

    def call
      rdoc = RDoc::RDoc.new
      rdoc.document(["--dry-run"] + @dirs)

      rdoc.generator.classes.each do |mod|
        next unless mod.module?
        mod.comment_location.each do |comments|
          comments.each do |comment|
            if comment.is_a?(RDoc::Comment)
              parse_module_comment(mod, comment)
            end
          end
        end
      end

      @parts
    end

    private

    def parse_module_comment(mod, comment)
      comment.parse.parts.each do |part|
        if part.type == :LABEL
          part.items.each do |item|
            if item.label[0].in?(MixinComment::Part::LABELS)
              parse_label_parts(mod, item.label[0], item.parts)
            end
          end
        end
      end
    end

    def parse_label_parts(mod, label, parts)
      attributes = parts.map do |part|
        part.parts.map do |text|
          text.strip.split(/\s*,\s*/)
        end
      end.flatten.compact

      @parts << Part.new(mod.full_name, label, attributes)
    end
  end
end
