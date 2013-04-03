TWITCONFIG = YAML.load_file(Rails.root.join("config/twitter.yml"))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'uBbQMkAZI1eRI7kJSzBzA', '7Ol8c6U5CrYdqqDqOTKxOyDA9XDoGE8Fn4248zoOD4'
end