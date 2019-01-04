FROM circleci/ruby:2.5.1-node-browsers
RUN mkdir /home/circleci/simpleerr
WORKDIR /home/circleci/simpleerr
COPY Gemfile /home/circleci/simpleerr/Gemfile
COPY Gemfile.lock /home/circleci/simpleerr/Gemfile.lock
ENV RAILS_ENV "production"
ENV RAILS_LOG_TO_STDOUT "1"
RUN bundle install
COPY . /home/circleci/simpleerr
RUN sudo chown -R circleci /home/circleci/simpleerr
RUN RAILS_MASTER_KEY=64fea545a5d51b743579b9d0a384ac6f bundle exec rake assets:clean
RUN RAILS_MASTER_KEY=64fea545a5d51b743579b9d0a384ac6f bundle exec rake assets:precompile
