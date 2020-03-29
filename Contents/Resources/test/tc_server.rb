#!/usr/bin/env ruby

require 'minitest/autorun'

require_relative 'lib/test_constants'
require_relative '../bundle/bundler/setup'

require 'repla/test'
require Repla::Test::REPLA_FILE
require Repla::Test::HELPER_FILE
require_relative '../lib/server'

# Test controller
class TestServer < Minitest::Test
  def setup
    path = File.expand_path(File.dirname(TEST_MARKDOWN_FILE))
    filename = File.basename(TEST_MARKDOWN_FILE)
    @window = Repla::Window.new
    @server = Repla::Markdown::Server.new(path, filename, @window)
  end

  def teardown
    @window.close
    @server.shutdown
  end

  def test_server
    result = nil
    Repla::Test.block_until do
      result = @window.do_javascript(TEST_H1_JAVASCRIPT)
      result == TEST_MARKDOWN_HEADER
    end
    assert_equal(TEST_MARKDOWN_HEADER, result)
  end

  # def test_bad_file
  # end

  # def test_server
  #   window = Repla::Window.new

  #   header = controller.view.do_javascript(TEST_H1_JAVASCRIPT)
  #   assert_equal(header, TEST_MARKDOWN_HEADER)
  #   # Load the second URL
  #   path = File.expand_path(File.dirname(TEST_MARKDOWN_FILE_TWO))
  #   filename = File.basename(file)
  #   server = Repla::Markdown::Server.new(markdown, filename, window)

  #   header_two = controller.view.do_javascript(TEST_H1_JAVASCRIPT)
  #   header_two.chomp!
  #   assert_equal(header_two, TEST_MARKDOWN_HEADER_TWO)
  #   # TODO: Manually call shutdown
  # end
end
