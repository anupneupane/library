TWITCONFIG = YAML.load_file(Rails.root.join("config/twitter.yml"))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITCONFIG['consumer_key'], TWITCONFIG['consumer_token']
end