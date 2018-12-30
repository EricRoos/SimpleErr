FROM circleci/ruby:2.5.1-node-browsers
RUN mkdir /home/circleci/simpleerr
WORKDIR /home/circleci/simpleerr
COPY Gemfile /home/circleci/simpleerr/Gemfile
COPY Gemfile.lock /home/circleci/simpleerr/Gemfile.lock
RUN bundle install
COPY . /home/circleci/simpleerr
