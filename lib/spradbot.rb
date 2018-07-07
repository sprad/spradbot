require 'forecast_io'

require 'spradbot/configuration'
require 'spradbot/weather_retriever'

module Spradbot
  class Server
    def self.run
      puts "running: #{ENV['SLACK_BOT_TOKEN']}"
    end
  end
end
