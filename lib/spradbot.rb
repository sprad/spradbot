require 'forecast_io'
require 'slack-ruby-client'

require 'spradbot/configuration'
require 'spradbot/command_parser'
require 'spradbot/weather_retriever'

module Spradbot
  class Server
    def self.start
      puts 'started'
      client = Slack::RealTime::Client.new

      client.on :message do |data|
        response = Spradbot::CommandParser.new.execute(data.text)

        if response
          client.web_client.chat_postMessage(channel: data.channel,
                                             text: response)
        end
      end

      client.start!
    end
  end
end
