FROM ruby:2.7.1-alpine

# Install important dependencies
RUN apk add build-base nodejs yarn tzdata sqlite-dev postgresql-client postgresql-dev git nano imagemagick --no-cache bash

RUN gem install bundler
RUN gem install rails -v '5.2.3'

RUN mkdir /myapp
RUN chmod -R 777 /myapp
WORKDIR /myapp



