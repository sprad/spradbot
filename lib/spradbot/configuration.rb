ForecastIO.configure do |configuration|
  configuration.api_key = ENV['DARKSKY_TOKEN']
end

Slack.configure do |config|
  config.token = ENV['SLACK_BOT_TOKEN']
end
