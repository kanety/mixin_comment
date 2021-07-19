namespace :mixin_comment do
  desc 'Verify mixin comments'
  task :verify => :environment do
    dirs = ENV.key?('DIRS') ? ENV['DIRS'].split(',') : [Rails.root.join('app').to_s]
    results = MixinComment.verify(dirs)
    results.each(&:show_errors)
  end
end
