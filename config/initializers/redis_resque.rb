require "#{Rails.root}/config/secret/redis_password.rb"

REDIS = Redis.new(:host => 'localhost', :port => 6379)
REDIS.auth(REDIS_PASSWORD)

require 'resque'
require 'resque/server'

Resque.redis.namespace = "resque:Analytics"
Resque.redis.auth(REDIS_PASSWORD)
