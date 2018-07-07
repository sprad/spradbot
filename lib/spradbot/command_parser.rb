module Spradbot
  class CommandParser
    def execute(input)
      command = input.downcase

      if command == 'weather now'
        WeatherRetriever.new.todays_weather
      elsif command == 'weather tomorrow'
        WeatherRetriever.new.tomorrows_weather
      else
        "Sorry, I don't know how to help."
      end
    end
  end
end
