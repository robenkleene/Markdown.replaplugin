#!/usr/bin/env ruby

require 'minitest/autorun'

require_relative 'lib/test_constants'
require_relative '../bundle/bundler/setup'

require 'repla/test'
require Repla::Test::REPLA_FILE
require Repla::Test::HELPER_FILE
require_relative '../lib/server'

# TestServer
class TestServer < Minitest::Test
  def setup
    path = File.expand_path(File.dirname(TEST_MARKDOWN_FILE))
    filename = File.basename(TEST_MARKDOWN_FILE)
    @window = Repla::Window.new
    @server = Repla::Markdown::Server.new(path, filename, @window)
    @server.start
  end

  def teardown
    @server.shutdown
    @window.close
  end

  def test_server
    result = nil
    Repla::Test.block_until do
      result = @window.do_javascript(TEST_H1_JAVASCRIPT)
      result == TEST_MARKDOWN_HEADER
    end
    assert_equal(TEST_MARKDOWN_HEADER, result)
    title = @window.do_javascript(TEST_TITLE_JAVASCRIPT)
    assert_equal(TEST_MARKDOWN_FILENAME, title)

    # Load the second URL
    url = @server.url_for_subpath(TEST_MARKDOWN_SUBPATH)
    @window.load_url(url)

    result = nil
    Repla::Test.block_until do
      result = @window.do_javascript(TEST_H1_JAVASCRIPT)
      result == TEST_MARKDOWN_HEADER_TWO
    end
    assert_equal(TEST_MARKDOWN_HEADER_TWO, result)
    title = @window.do_javascript(TEST_TITLE_JAVASCRIPT)
    assert_equal(TEST_MARKDOWN_FILENAME_TWO, title)
  end

  # def test_bad_file
  # end
end

# TestServerTwo
class TestServerTwo < Minitest::Test
  def setup
    path = File.expand_path(File.dirname(TEST_MARKDOWN_FILE_TWO))
    filename = File.basename(TEST_MARKDOWN_FILE_TWO)
    @window = Repla::Window.new
    @server = Repla::Markdown::Server.new(path, filename, @window)
    @server.start
  end

  def teardown
    @server.shutdown
    @window.close
  end

  def test_server_two_files
    result = nil
    Repla::Test.block_until do
      result = @window.do_javascript(TEST_H1_JAVASCRIPT)
      result == TEST_MARKDOWN_HEADER_TWO
    end
    assert_equal(TEST_MARKDOWN_HEADER_TWO, result)
    title = @window.do_javascript(TEST_TITLE_JAVASCRIPT)
    assert_equal(TEST_MARKDOWN_FILENAME_TWO, title)
  end
end
