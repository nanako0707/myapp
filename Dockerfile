FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    yarn \
    vim \
    locales \
    locales-all \
    postgresql-client \
    cron \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
ENV LANG ja_JP.UTF-8

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem update bundler
RUN bundle install
COPY . /myapp
RUN yarn install --check-files
RUN bundle exec rails assets:precompile
RUN mkdir -p tmp/sockets

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD ["rails", "server", "-b", "0.0.0.0", "RAILS_ENV=production"]