require 'cf-deploy'

CF::Deploy.rake_tasks! do
  manifest_glob 'config/manifests/*'
  api 'api.run.pivotal.io'
  username 'accounts+sslcatch@madetech.co.uk'
  password '8C4BKDyUD$p3nho['
  organisation 'MadeTech'
  space 'SSLCatch'

  environment production: ['assets:precompile', 'assets:clean'] do
    flip_route 'sslcatch.com', 'www'
  end
end

namespace :cf do
  desc 'Only run on the first application instance'
  task :on_first_instance do
    instance_index = JSON.parse(ENV['VCAP_APPLICATION'])['instance_index'] rescue nil
    exit(0) unless instance_index == 0
  end
end
