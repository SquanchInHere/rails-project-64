install:
	bundle install

yarn_install:
	yarn install

lint_rubocop:
	rubocop

lint_slim:
	slim-lint

test:
	bin/rails test