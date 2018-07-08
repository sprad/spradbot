RSpec.describe Spradbot::CommandParser do
  subject { Spradbot::CommandParser.new }

  describe '#execute' do
    it "knows how to get today's weather" do
      VCR.use_cassette('forecast') do
        expect(subject.execute('Weather now')).to eq('Clear and 76 degrees.')
      end
    end

    it "knows how to get tomorrow's weather" do
      VCR.use_cassette('forecast') do
        expect(subject.execute('Weather tomorrow'))
          .to eq('Clear throughout the day. High of 84 degrees.')
      end
    end

    it "doesn't care about the command's case" do
      VCR.use_cassette('forecast') do
        expect(subject.execute('weaTher Now'))
          .to eq('Clear and 76 degrees.')
      end
    end

    it "doesn't respond when the input isn't understood" do
      expect(subject.execute('weather purple')).to be_nil
    end
  end
end
