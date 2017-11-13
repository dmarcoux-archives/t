FROM ruby:2.4.2
MAINTAINER Dany Marcoux

# Install PostgreSQL client
RUN apt-get update && apt-get install --yes postgresql-client

# Default to UTF-8 file.encoding
# https://github.com/docker-library/docs/tree/master/ruby#encoding
ENV LANG C.UTF-8

# Set working directory
RUN mkdir app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# Add directories/files which are not frequently modified
# The order is defined by modification frequency to benefit from the layers of caching in Docker as much as possible
COPY bin $APP_ROOT/bin
COPY public $APP_ROOT/public
COPY .rubocop.yml $APP_ROOT/
COPY Rakefile $APP_ROOT/
COPY config.ru $APP_ROOT/
COPY Gemfile $APP_ROOT/
COPY Gemfile.lock $APP_ROOT/

RUN bundle install --jobs 4

# Add directories/files which are frequently modified
# The order is defined by modification frequency to benefit from the layers of caching in Docker as much as possible
COPY db $APP_ROOT/db
COPY lib $APP_ROOT/lib
COPY spec $APP_ROOT/spec
COPY app $APP_ROOT/app

CMD bash