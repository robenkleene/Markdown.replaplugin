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

listener = Listen.to(path) do |_modified, _added, _removed|
  window.reload
end
listener.start

%w[INT TERM].each do |signal|
  trap(signal) { server.shutdown }
end

server.start
sleep
