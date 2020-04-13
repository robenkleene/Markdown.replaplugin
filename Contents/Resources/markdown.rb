#!/usr/bin/env ruby --disable-gems

require_relative 'bundle/bundler/setup'
require 'repla'
# One of the dependencies of `listen` assumes gems is available, so we re-add
# it here
require 'rubygems'
require 'listen'

require_relative 'lib/server'

file = ARGF.file unless ARGV.empty?
path = File.expand_path(File.dirname(file))
filename = File.basename(file)

window = Repla::Window.new
server = Repla::Markdown::Server.new(path, filename, window)

%w[INT TERM].each do |signal|
  trap(signal) { server.shutdown(signal) }
end

server.start

require 'etc'
home = Etc.getpwuid.dir
real_pwd = File.realpath(Dir.pwd)
real_home = File.realpath(home)
real_library = File.realpath(File.join(home, 'Library'))
disable_listen = [real_home, real_library].include?(real_pwd)
unless disable_listen
  listener = Listen.to(path) do |_modified, _added, _removed|
    window.reload
  end
  listener.start
end

sleep
