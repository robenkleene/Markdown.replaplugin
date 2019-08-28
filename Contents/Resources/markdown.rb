#!/System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/bin/ruby

require_relative 'bundle/bundler/setup'
require 'webconsole'
require 'listen'

require_relative 'lib/controller'

file = ARGF.file unless ARGV.empty?
markdown = ARGF.read

# This should allow the plugin to process Markdown from stdin, but
# the Web Console Application doesn't yet support running a plugin
# and reading from stdin simultaneously
# if !file
#   WebConsole::Markdown::Controller.new(markdown)
#   exit
# end

filename = File.basename(file)
controller = WebConsole::Markdown::Controller.new(markdown, filename)

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
