#!/usr/bin/env ruby

require_relative 'bundle/bundler/setup'
require 'webrick'
require 'redcarpet'

module WEBrick
  # Servlet
  module HTTPServlet
    class MarkdownHandler < AbstractServlet
      Renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
      def initialize(server, local_path)
        super(server, local_path)
        @local_path = local_path
      end

      def do_GET(_req, res)
        res.body = <<~EOF
          <html>
          <body>
          #{Renderer.render IO.read(@local_path)}
          </body>
          </html>
        EOF
        res['content-type'] = 'text/html'
      end
    end
    FileHandler.add_handler('md', MarkdownHandler)
  end
end

server = WEBrick::HTTPServer.new Port: 1234, DocumentRoot: Dir.pwd
%w[INT TERM].each do |signal|
  trap(signal) { server.shutdown }
end

server.start
