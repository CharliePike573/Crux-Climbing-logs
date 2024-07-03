FROM ruby:3.3.1

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    nodejs \
    libgeos-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -qq && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

ENTRYPOINT ["/app/docker-entrypoint.sh"]
