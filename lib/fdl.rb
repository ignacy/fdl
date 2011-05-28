require "fdl/version"
require "sinatra/base"

module Fdl
    class MainApp < Sinatra::Base
        get "/log" do
            if params[:message].nil? || 
                    /\A\s*\Z/ =~ params[:message]
                halt 400
            end

            MainApp.push(params[:message])
            201
        end

        def self.push message

        end
    end
end
