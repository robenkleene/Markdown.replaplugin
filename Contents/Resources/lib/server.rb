require 'webrick'
require 'redcarpet'

module WEBrick
  # Servlet
  module HTTPServlet
    # MarkdownHandler
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

module Repla
  module Markdown
    # Server
    class Server
      def initialize(filename = nil)
        @window = Repla::Window.new
        @server = WEBrick::HTTPServer.new Port: 1234, DocumentRoot: Dir.pwd
        @filename = filename
      end

      def start
        # TODO: Open `@filename`
        server.start
      end

      def shutdown
        server.shutdown
      end

      def reload
        @window.reload
      end
    end
  end
end
