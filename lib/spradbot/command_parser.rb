module Spradbot
  class CommandParser
    def execute(input)
      command = input.downcase

      if command.include?('weather now')
        WeatherRetriever.new.todays_weather
      elsif command.include?('weather tomorrow')
        WeatherRetriever.new.tomorrows_weather
      end
    end
  end
end
