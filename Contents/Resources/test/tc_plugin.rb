#!/usr/bin/env ruby

require 'minitest/autorun'

require_relative 'lib/test_constants'
require_relative '../bundle/bundler/setup'
require 'repla/test'
require Repla::Test::REPLA_FILE
require Repla::Test::HELPER_FILE

# Test plugin
class TestPlugin < Minitest::Test
  def setup
    Repla.load_plugin(TEST_PLUGIN_PATH)
  end

  def test_load_markdown_file
    Repla.run_plugin(TEST_PLUGIN_NAME,
                     TEST_PLUGIN_PATH,
                     [TEST_MARKDOWN_FILE])

    window_id = nil
    Repla::Test.block_until do
      window_id = Repla.window_id_for_plugin(TEST_PLUGIN_NAME)
      !window_id.nil?
    end

    window_id = Repla.window_id_for_plugin(TEST_PLUGIN_NAME)
    window = Repla::Window.new(window_id)
    header = nil
    Repla::Test.block_until do
      header = window.do_javascript(TEST_H1_JAVASCRIPT)
      header == TEST_MARKDOWN_HEADER
    end
    assert_equal(header, TEST_MARKDOWN_HEADER)

    window.close
  end
end
