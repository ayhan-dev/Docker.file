FROM ruby:3.2-slim-bullseye
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
  bundle config set without "development test" && \
  bundle install
COPY . .
CMD ["rails", "server", "-b", "0.0.0.0"]




FROM ruby:3.2-slim-bullseye
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
  bundle config set without "dev test" && \
  bundle install
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN RAILS_ENV=production SECRET_KEY_BASE=assets bundle exec rails assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]

