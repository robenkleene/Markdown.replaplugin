#!/usr/bin/env ruby

require 'Shellwords'

require_relative '../bundle/bundler/setup'
require 'repla'

require_relative 'lib/test_constants'
require_relative '../lib/controller'

# Test controller
class TestController < Minitest::Test
  def test_controller
    markdown = File.read(TEST_MARKDOWN_FILE)
    filename = File.basename(TEST_MARKDOWN_FILE)

    controller = Repla::Markdown::Controller.new(markdown, filename)

    header = controller.view.do_javascript(TEST_H1_JAVASCRIPT)
    assert_equal(header, TEST_MARKDOWN_HEADER)
    markdown_two = File.read(TEST_MARKDOWN_FILE_TWO)
    controller.markdown = markdown_two
    header_two = controller.view.do_javascript(TEST_H1_JAVASCRIPT)
    header_two.chomp!

    assert_equal(header_two, TEST_MARKDOWN_HEADER_TWO)

    controller.view.close
  end
end
