require_relative "fdl/version"
require "sinatra"
require "sinatra/base"

module Fdl
    class Fdl < Sinatra::Base
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

            Fdl.push(params[:message])
            201
        end

        def self.push message

        end
    end
end
