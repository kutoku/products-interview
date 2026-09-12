source "https://rubygems.org"

ruby ">= 3.3", "< 3.5"
gem "rails", "8.1.3"
# Rails 8.1.3 passes positional options to JSON.parse when reading sessions.
gem "json", "~> 2.0"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "kaminari", "~> 1.2"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  gem "web-console"
end
