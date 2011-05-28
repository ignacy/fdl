require "minitest/autorun"
require "fdl"


class TestFdl < MiniTest::Unit::TestCase
    def test_setup_e
        assert Fdl::MainApp
    end
end
