# config/unicorn.rb
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 60
preload_app true

APP_PATH = ENV['HOME']+"/rails_basic"
working_directory APP_PATH

listen ENV["HOME"] + "/shared/socket/unicorn.sock", :backlog => 64
pid ENV["HOME"] + "/shared/pid/unicorn.pid"
stderr_path ENV['HOME'] + "/shared/log/unicorn_err.log" if ENV["RAILS_ENV"] == "production"
stdout_path ENV['HOME'] + "/shared/log/unicorn_out.log" if ENV["RAILS_ENV"] == "production"

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection

  defined?(Analytics) and
    Analytics.init(secret: ENV['SEGMENTIO_API_SECRET'])
end
