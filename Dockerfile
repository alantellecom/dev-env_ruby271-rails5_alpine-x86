FROM ruby:2.6-alpine

RUN apk add --no-cache bash

# Install important dependencies
RUN apk add build-base nodejs yarn tzdata sqlite-dev postgresql-client postgresql-dev python nano

RUN gem install bundler -v 1.16.1
RUN gem install rails -v '5.2.3'


