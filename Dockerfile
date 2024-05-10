FROM ruby:3.3.0-bullseye as base

WORKDIR /application

# RUN apt-get update -qq && apt-get install -y curl gnupg git libpq-dev build-essential
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs
# Install cron
RUN apt-get update && apt-get install -y cron 

RUN gem install bundler
COPY Gemfile* /application/

RUN bundle install

COPY . .
RUN if [ "$RAILS_ENV" != "development" ]; then rails assets:precompile; fi

EXPOSE 3000

# ENTRYPOINT ["/bin/bash","/application/bin/docker-entrypoint.sh"]
CMD [ "bundle","exec", "puma", "config.ru"] # CMD ["rails","server"]
