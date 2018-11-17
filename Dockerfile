FROM ruby:2.5

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs build-essential libpq-dev

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN bundle install
RUN npm install

COPY . /app
