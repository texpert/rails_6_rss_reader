# frozen_string_literal: true

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || ENV['MAX_THREADS'] || 1)
workers_count = Integer(ENV['WEB_CONCURRENCY'] || 1)
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
if self.class.const_defined?(:NGROK_ENABLED)
  bind 'ssl://localhost:3000'
else
  port ENV.fetch('PORT', 3000)
end

# Specifies the `environment` that Puma will run in.
environment ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')

if workers_count > 1
  workers workers_count
  # preload_app!
  fork_worker
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
