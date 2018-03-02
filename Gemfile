source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'kaminari', '~>1.1.1'
gem 'active_model_serializers', '~>0.10.7'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'faker', '~>1.8.7'
  gem 'rspec-rails', '~>3.7.2'
  gem 'shoulda-matchers', '~>3.1.2'
  gem 'factory_bot_rails', '~>4.8.2'
  gem 'pry-state', '~>0.1.10'
end
