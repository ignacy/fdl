require "rubygems"
require 'minitest/unit'
require "rack/test"
require "fdl"
require "mocha"

MiniTest::Unit.autorun

class TestFdl < MiniTest::Unit::TestCase
    include Rack::Test::Methods

    def app
        Fdl::WebApp.new
    end

    def test_post_log_message
        Fdl::WebApp.expects(:push).with("hello")
        get "/log", :message => "hello"
        assert_equal 204, last_response.status
    end

    def test_post_message_epty
       Fdl::WebApp.expects(:push).never 
       get "/log", :message => "       "
       assert_equal 400, last_response.status
    end

    def test_post_no_message
        Fdl::WebApp.expects(:push).never
        get "/log" 
        assert_equal 400, last_response.status
    end
end
