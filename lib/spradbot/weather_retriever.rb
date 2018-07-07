module Spradbot
  class WeatherRetriever
    def todays_weather
      "#{current.summary} and #{current.temperature.round} degrees."
    end

    def tomorrows_weather
      "#{tomorrow.summary} High of #{tomorrow.temperatureHigh.round} degrees."
    end

    private

    def current
      forecast.currently
    end

    def tomorrow
      forecast.daily.data[1]
    end

    def forecast
      # New York, NY
      @forecast ||= ForecastIO.forecast(40.730610, -73.935242)
    end
  end
end
