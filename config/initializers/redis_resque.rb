require "#{Rails.root}/config/secret/redis_password.rb"

REDIS = Redis.new(:host => 'localhost', :port => 6379)

require 'resque'
require 'resque/server'

Resque.redis.namespace = "resque:analytics"
