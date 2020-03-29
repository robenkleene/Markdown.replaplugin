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

      # rubocop:disable Naming/MethodName
      def do_GET(_req, res)
        # rubocop:enable Naming/MethodName
        res.body = <<~BODY
          <!DOCTYPE html>
          <html lang="en">
          <head>
            <meta charset="utf-8" />
          <html>
          <head>
            <title>Markdown</title>
          </head>
          <body>
          #{Renderer.render IO.read(@local_path)}
          </body>
          </html>
        BODY
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
      def initialize(path, filename = nil, delegate = nil)
        @delegate = delegate
        @filename = filename
        @server = WEBrick::HTTPServer.new(
          Port: 0,
          DocumentRoot: path,
          StartCallback: proc do
                           # Write `1` to signal server start
                           wt.write(1)
                           wt.close
                         end
        )
        @port = @server.port
      end

      def start
        rd, wt = IO.pipe
        pid fork do
          rd.close
          server.start
        end

        wt.close
        # Read `1` to know to continue when server is started
        rd.read(1)
        rd.close

        url = "https://localhost:#{@port}/#{@filename}"
        @delegate.load_url(url) unless @delegate.nil?
        sleep
      end

      def shutdown
        server.shutdown
      end
    end
  end
end
