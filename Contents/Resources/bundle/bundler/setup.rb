require 'rbconfig'
# ruby 1.8.7 doesn't define RUBY_ENGINE
ruby_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
ruby_version = RbConfig::CONFIG["ruby_version"]
path = File.expand_path('..', __FILE__)
$:.unshift "#{path}/"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/extensions/universal-darwin-18/2.3.0/ffi-1.11.1"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/ffi-1.11.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/flt-1.5.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rb-fsevent-0.10.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rb-inotify-0.10.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/ruby_dep-1.5.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/listen-3.1.5/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/nio-0.2.5/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/raster-0.2.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/extensions/universal-darwin-18/2.3.0/redcarpet-3.5.0"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/redcarpet-3.5.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/repla-0.9.2/lib"
