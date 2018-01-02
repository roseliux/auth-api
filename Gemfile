source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'
# Rack::Attack is a rack middleware to protect your web app from bad clients.
gem 'rack-attack'

# Simple, secure token based authentication for Rails
gem 'devise_token_auth', '0.1.43.beta1'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'


group :development, :test do
  gem 'pry'
  gem 'pry-remote'
  gem 'faker'
  # for debug in rubymine
  gem 'ruby-debug-ide'
  gem 'debase', '~> 0.1.8'
  gem 'rubocop'
  # for secrets
  gem 'figaro'
  # MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface.
  gem 'mailcatcher'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
