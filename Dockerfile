FROM circleci/ruby:2.4.1-node-browsers
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir simpleerr/
WORKDIR /simpleerr
COPY Gemfile /simpleerr/Gemfile
COPY Gemfile.lock /simpleerr/Gemfile.lock
RUN bundle install
COPY . /simpleerr
