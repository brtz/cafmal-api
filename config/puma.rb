# config/puma.rb

threads_min = ENV['CAFMAL-API_PUMA_THREADS_MIN'] || 8
threads_max = ENV['CAFMAL-API_PUMA_THREADS_MAX'] || 32
workers_max = ENV['CAFMAL-API_PUMA_WORKERS'] || 3
ram = ENV['CAFMAL-API_PUMA_RAM'] || 1024

threads threads_min.to_i, threads_max.to_i
workers workers_max.to_i
preload_app!

on_worker_boot do
   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

before_fork do
  require 'puma_worker_killer'

  PumaWorkerKiller.enable_rolling_restart(1 * 3600)
  PumaWorkerKiller.frequency = 30
  PumaWorkerKiller.ram = ram.to_i

  PumaWorkerKiller.start
end