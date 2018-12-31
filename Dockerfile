# Install alpine Linux and ruby-v2.5.3
FROM ruby:2.5.3-alpine3.8

# Update and install base packages
RUN apk update && apk upgrade && apk add --virtual build-dependencies build-base gcc wget postgresql-dev tzdata

# Throw errors if the gem file has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Create app directory and make it WORKDIR
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install all gems
RUN bundle install

# Copy all of the files from the current directory to WORKDIR
COPY . .
