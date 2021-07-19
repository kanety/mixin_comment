# frozen_string_literal: true

module MixinComment
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'mixin_comment/tasks/verify.rake'
    end
  end
end
