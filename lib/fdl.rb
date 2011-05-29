require_relative "fdl/version"
require "sinatra"
require "sinatra/base"
require "haml"

module Fdl
    class WebApp < Sinatra::Base
        set :root, File.expand_path("../..", __FILE__)

        get "/" do
            [200, { "context-type" => "text/html"}, 
                File.read("public/index.html")]
        end

        get "/log" do
            if params[:message].nil? || 
                /\A\s*\Z/ =~ params[:message]
                halt 400
            end

            WebApp.push(params[:message])
            204
        end

        get "/show" do
            @logs = File.readlines("public/log.txt")
            haml :show
        end

        def self.push message
           File.open("public/log.txt", "a+") do |f|
              f.puts message
           end 
        end
    end
end
