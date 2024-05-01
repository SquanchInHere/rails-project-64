#!/usr/bin/env bash
# exit on error
set -o errexit

bundle config set --local without development
bundle install
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop
bundle exec rails db:create db:migrate db:seed
bundle exec rails assets:precompile
bundle exec rails assets:clean