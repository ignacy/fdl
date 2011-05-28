require "minitest/autorun"
require "rack/test"
require "fdl"
require "mocha"


class TestFdl < MiniTest::Unit::TestCase
    include Rack::Test::Methods

    def app
        Fdl::MainApp.new
    end

    def test_post_log_message
        Fdl::MainApp.expects(:push).with("hello")
        get "/log", message: "hello"
        assert_equal 201, last_response.status
    end

    def test_post_message_epty
       Fdl::MainApp.expects(:push).never 
       get "/log", message: "       "
       assert_equal 400, last_response.status
    end

    def test_post_no_message
        Fdl::MainApp.expects(:push).never
        get "/log" 
        assert_equal 400, last_response.status
    end
end
