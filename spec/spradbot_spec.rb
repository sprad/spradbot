RSpec.describe Spradbot do
  it 'has a version number' do
    expect(Spradbot::VERSION).not_to be nil
    expect(ENV['SLACK_BOT_TOKEN']).not_to be nil
  end
end
