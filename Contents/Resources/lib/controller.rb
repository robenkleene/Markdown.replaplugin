require 'redcarpet'
require_relative 'view'
require 'erb'

module Repla
  module Markdown
    # Controller
    class Controller < Repla::Controller
      def initialize(markdown = nil, filename = nil)
        @renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                            autolink: true,
                                            space_after_headers: true)
        html = @renderer.render(markdown)
        @view = View.new(html, filename)
      end

      def markdown=(markdown)
        @view.html = @renderer.render(markdown)
      end

      def load_erb_from_path(path)
        erb = File.new(path).read
        load_erb(erb)
      end

      def load_erb(erb)
        template = ERB.new(erb, nil, '-')
        html = template.result(binding)
        load_html(html)
      end
    end
  end
end
