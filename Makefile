init:
	bundle install
	make build

serve:
	bundle exec jekyll serve

build:
	bundle exec jekyll build