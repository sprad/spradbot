RSpec.describe Spradbot::WeatherRetriever do
  subject { Spradbot::WeatherRetriever.new }

  describe '#todays_weather' do
    it "gets today's weather" do
      VCR.use_cassette('forecast') do
        expect(subject.todays_weather).to eq('Clear and 76 degrees.')
      end
    end
  end

  describe '#tomorrows_weather' do
    it "gets tomorrow's weather" do
      VCR.use_cassette('forecast') do
        expect(subject.tomorrows_weather)
          .to eq('Clear throughout the day. High of 84 degrees.')
      end
    end
  end
end
