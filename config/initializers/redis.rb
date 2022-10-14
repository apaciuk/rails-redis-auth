# frozen_string_literal: true

$redis = Redis::Namespace.new('redis-auth', redis: Redis.new)
