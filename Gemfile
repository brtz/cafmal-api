source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'redis-rails', '~> 5.0.1'
gem 'unicorn'
gem 'unicorn-worker-killer'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'oj'
gem 'oj_mimic_json'
# JWT auth
gem 'knock'
# RBAC
gem 'access-granted', '~> 1.1.0'
# cross site origin
gem 'rack-cors'
# rate limiting / throttle
gem 'rack-attack'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
