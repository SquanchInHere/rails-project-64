install:
	bundle install

yarn_install:
	yarn install

lint_rubocop:
	bundle exec rake lint:rubocop

lint_slim:
	bundle exec rake lint:slim

test:
	bin/rails test