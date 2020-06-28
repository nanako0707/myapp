FROM ruby:2.6.5
ENV TZ=Asia/Tokyo
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get update && apt-get install -y busybox-static
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
COPY crontab /var/spool/cron/crontabs/root

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["busybox", "crond", "-l", "8", "-L", "/dev/stderr", "-f"]
# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]