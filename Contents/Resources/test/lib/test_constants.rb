TEST_DATA_DIRECTORY = File.join(File.dirname(__FILE__), '..', 'data')

TEST_H1_JAVASCRIPT = "document.getElementsByTagName('h1')[0].innerHTML".freeze

TEST_MARKDOWN_FILE = File.join(TEST_DATA_DIRECTORY, 'markdown.md')
TEST_MARKDOWN_HEADER = 'Header 1'.freeze

TEST_MARKDOWN_FILE_TWO = File.join(TEST_DATA_DIRECTORY, 'markdown 2.markdown')
TEST_MARKDOWN_HEADER_TWO = 'Header 2'.freeze

TEST_PLUGIN_PATH = File.expand_path(File.join(File.dirname(__FILE__),
                                              '../../../..'))
TEST_PLUGIN_NAME = 'Markdown'.freeze
