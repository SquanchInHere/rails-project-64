
install:
	bundle install
lint:
	rubocop
slim_lint:
	bin/rails slim_lint
test:
	bin/rails test
