#!/usr/bin/env bash
# exit on error
set -o errexit

bundle config set --local without development
bundle install
bundle exec rails db:drop db:create db:migrate db:seed
bundle exec rails assets:precompile
bundle exec rails assets:clean