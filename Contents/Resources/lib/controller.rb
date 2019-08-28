require 'redcarpet'
require_relative 'view'

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
    end
  end
end
