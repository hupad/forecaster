source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'concurrent-ruby', '1.3.4'
gem "rails", "~> 6.1.7"
gem 'pg', '~> 1.1'
gem 'puma', '6.4.2'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'faraday'

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring', "~> 4.2.1"
end

group :development, :test do
  gem "pry-remote"
end

group :test do
  gem 'webmock'
  gem 'rails-controller-testing'
  gem "rspec-rails", "~> 6.1.4"
  gem "shoulda-matchers", "~>2.5.0"
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
  gem 'timecop'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
