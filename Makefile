all: install build

env:
ifeq ($(OS),Windows_NT)
	copy example.env test.env
else
	cp example.env test.env
endif

install:
	bundle install

check:
	bundle exec jekyll doctor

start:
	bundle exec jekyll serve

build:
	bundle exec jekyll build

actions:
	act -g
	act --secret-file .env -a host