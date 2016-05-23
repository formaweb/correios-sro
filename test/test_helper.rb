require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/correios_sro"

Minitest::Test = Minitest::Unit::TestCase unless defined?(Minitest::Test)