require 'resque/tasks'

task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'
  Resque::Worker.all.each {|w| w.unregister_worker}
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"