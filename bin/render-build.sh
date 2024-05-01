#!/usr/bin/env bash
# exit on error
set -o errexit

bundle config set --local without development
bundle install
bundle exec rails db:migrate
bundle exec rails assets:precompile
bundle exec rails assets:clean