source 'https://rubygems.org'

gem 'chef', "~> #{ENV['CHEF_VERSION'] || 14}"
gem 'berkshelf'
gem 'rake'

group :lint do
  gem 'cookstyle'
end

group :unit do
  gem 'chefspec'
end

group :kitchen do
  gem 'test-kitchen'
  gem 'kitchen-docker'
  gem 'kitchen-inspec'
end

group :development do
  gem 'guard'
  gem 'guard-rubocop'
  gem 'guard-rspec'
end
