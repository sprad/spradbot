module Spradbot
  class Server
    def self.run
      puts "running: #{ENV['SLACK_BOT_TOKEN']}"
    end
  end
end
