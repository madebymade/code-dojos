begin
  require 'scss_lint/rake_task'

  desc 'Run scss lint against SCSS files'
  SCSSLint::RakeTask.new do |t|
    t.config = 'app/assets/stylesheets/scss_lint.yml'
    t.files = ['app/assets/stylesheets']
  end
rescue LoadError
end
