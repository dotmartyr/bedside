require 'resque'
require 'resque/server'
require 'yaml'

#resque_config = YAML.load_file(Rails.root + 'config/redis.yml')
#Resque.redis = resque_config[Rails.env]
if Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)
end

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

Resque.inline = true if Rails.env.eql?("test")