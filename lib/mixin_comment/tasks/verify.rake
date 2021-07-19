namespace :mixin_comment do
  desc 'Verify mixin comments'
  task :verify => :environment do
    dirs = ENV.key?('DIRS') ? ENV['DIRS'].split(',') : [Rails.root.join('app').to_s]
    results = MixinComment.verify(dirs)
    results.each do |result|
      result.errors.each do |klass, attr|
        puts "#{klass}##{attr} is #{result.label.singularize} by #{result.module_name}"
      end
    end
  end
end
