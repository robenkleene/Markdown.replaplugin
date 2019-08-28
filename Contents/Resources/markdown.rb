#!/System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/bin/ruby

require_relative 'bundle/bundler/setup'
require 'repla'
require 'listen'

require_relative 'lib/controller'

file = ARGF.file unless ARGV.empty?
markdown = ARGF.read

filename = File.basename(file)
controller = Repla::Markdown::Controller.new(markdown, filename)

path = File.expand_path(File.dirname(file))

regex = Regexp.quote(filename)
listener = Listen.to(path, only: /^#{regex}$/) do |modified, _added, _removed|
  file = File.open(modified[0])
  File.open(file) do |f|
    controller.markdown = f.read
  end
end

listener.start

trap('SIGINT') do
  exit
end

sleep
