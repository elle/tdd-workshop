source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.5"

gem "rails", github: "rails/rails", branch: "main"

gem "bootsnap", require: false
gem "email_validator", "1.6.0"
gem "good_job"
gem "haml-rails"
gem "http"
gem "importmap-rails"
gem "jsonapi-resources"
gem "net-http"
gem "pg"
gem "premailer-rails"
gem "puma", "~> 5.0"
gem "responders", "~> 3.0"
gem "sassc-rails"
gem "simple_form"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data"
# gem "bcrypt", "~> 3.1.7"

group :development, :test do
  # gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "awesome_print"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "hirb"
  gem "pry-byebug"
  gem "rspec-rails", "5.1.2"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
  gem "spring"
  gem "web-console"
end

group :test do
  gem "cuprite"
  gem "database_cleaner-active_record"
  gem "email_spec"
  gem "launchy"
  gem "rails-controller-testing"
  gem "shoulda-matchers", "~> 5.0"
  gem "webmock"
end
