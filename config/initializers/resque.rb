require 'resque'
require 'resque/server'
require 'yaml'

#resque_config = YAML.load_file(Rails.root + 'config/redis.yml')
#Resque.redis = resque_config[Rails.env]

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

Resque.inline = true if Rails.env.eql?("test")