# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

task :environment do
  require File.expand_path('lib/alpaca_device/api.rb', File.dirname(__FILE__))
end

desc "Print out routes"
task :routes => :environment do
  AlpacaDevice::Api.routes.each do |route|
    method = route.request_method.ljust(10)
    path = route.path
    puts "#{method} #{path}"
  end
end

task default: :test
