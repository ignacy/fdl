$:.unshift File.join(File.dirname(__FILE__), "lib")

require "fdl"
run Fdl::WebApp
