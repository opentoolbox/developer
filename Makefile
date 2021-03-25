include .env

init:
	cat .env.example > .env
	bundle install
	make build

serve:
	bundle exec jekyll serve

build:
	bundle exec jekyll build

services:
	echo $(ALGOLIA_API_KEY) > _algolia_api_key
	bundle exec jekyll algolia