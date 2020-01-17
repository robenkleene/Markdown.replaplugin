module Repla
  module Markdown
    # View
    class View < Repla::View
      BASE_DIRECTORY = File.join(File.dirname(__FILE__), '..')
      VIEWS_DIRECTORY = File.join(BASE_DIRECTORY, 'views')
      VIEW_TEMPLATE = File.join(VIEWS_DIRECTORY, 'view.html.erb')

      def initialize(html = nil, filename = nil)
        super()
        @html = html
        @filename = filename
        self.root_access_directory_path = File.expand_path(BASE_DIRECTORY)
        load_erb_from_path(VIEW_TEMPLATE)
      end

      def body
        @html
      end

      def title
        return @filename if @filename

        super
      end

    end
  end
end
