TEST_DATA_DIRECTORY = File.join(File.dirname(__FILE__), '..', 'data')

TEST_H1_JAVASCRIPT = "document.getElementsByTagName('h1')[0].innerHTML".freeze
TEST_TITLE_JAVASCRIPT = 'document.title'.freeze

TEST_MARKDOWN_NOEXIST_FILENAME = 'Doesn\'t Exist'.freeze
TEST_MARKDOWN_NOEXIST_TITLE = 'Not Found'.freeze
TEST_MARKDOWN_NOEXIST_FILE = File.join(TEST_DATA_DIRECTORY,
                                       TEST_MARKDOWN_NOEXIST_FILENAME)

TEST_MARKDOWN_FILENAME = 'markdown.md'.freeze
TEST_MARKDOWN_FILE = File.join(TEST_DATA_DIRECTORY, TEST_MARKDOWN_FILENAME)
TEST_MARKDOWN_HEADER = 'Header 1'.freeze

TEST_MARKDOWN_DIRECTORY_TWO = 'Directory 2'.freeze
TEST_MARKDOWN_FILENAME_TWO = 'markdown 2.markdown'.freeze
TEST_MARKDOWN_SUBPATH = File.join(TEST_MARKDOWN_DIRECTORY_TWO,
                                  TEST_MARKDOWN_FILENAME_TWO)
TEST_MARKDOWN_FILE_TWO = File.join(TEST_DATA_DIRECTORY,
                                   TEST_MARKDOWN_SUBPATH)
TEST_MARKDOWN_HEADER_TWO = 'Header 2'.freeze

TEST_PLUGIN_PATH = File.expand_path(File.join(File.dirname(__FILE__),
                                              '../../../..'))
TEST_PLUGIN_NAME = 'Markdown'.freeze
