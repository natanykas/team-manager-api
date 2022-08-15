FROM ruby:3.0.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /team-manager-api
COPY Gemfile /team-manager-api/Gemfile
COPY Gemfile.lock /team-manager-api/Gemfile.lock
RUN bundle install
COPY . /team-manager-api

EXPOSE 3000
