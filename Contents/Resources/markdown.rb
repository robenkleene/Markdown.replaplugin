#!/usr/bin/env ruby

require_relative 'bundle/bundler/setup'
require 'repla'
require 'listen'

require_relative 'lib/server'

file = ARGF.file unless ARGV.empty?
path = File.expand_path(File.dirname(file))
filename = File.basename(file)

server = Repla::Markdown::Server.new(filename)

listener = Listen.to(path) do |_modified, _added, _removed|
  server.reload
end
listener.start

%w[INT TERM].each do |signal|
  trap(signal) { server.shutdown }
end
server.start
