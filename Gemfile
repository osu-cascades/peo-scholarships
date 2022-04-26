source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "airbrake"
gem "aws-sdk-s3", require: false
# gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "bootstrap", "~> 4.6"
gem "caxlsx", "~> 3.1"
gem "caxlsx_rails", "~> 0.6.2"
gem "coffee-rails", "~> 5.0.0"
gem "devise"
gem "haml"
gem "haml-rails"
# gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "jbuilder"
gem "jquery-rails"
# gem "kredis"
gem "pg"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.2.3"
# gem "redis", "~> 4.0"
gem "recaptcha", require: "recaptcha/rails"
gem "sassc-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "guard"
  gem "guard-minitest"
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
