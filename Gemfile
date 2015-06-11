source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.1'

# BD
gem 'pg'

# Frontend
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'simple_form', '~> 3.1.0'
gem 'bootstrap-sass', '~> 3.3.4'

# Authentication
gem 'devise'

# Others
gem "start"
gem "responders"

group :development do
  gem 'quiet_assets', '~> 1.1.0'
  gem 'xray-rails', '~> 0.1.15'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.2.1'
  gem 'capybara', '~> 2.4.4'
  gem 'factory_girl_rails', '~> 4.5.0'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
end

group :production do
  gem 'puma'
  gem 'foreman'
  gem 'rails_12factor', '~> 0.0.3'
end