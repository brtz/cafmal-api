FROM ruby:2.3
MAINTAINER Nils Bartels <n.bartels@bigpoint.net>

ENV APP_HOME /cafmal-api
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/
RUN bundle install

ADD . $APP_HOME

RUN bundle exec rake assets:precompile

CMD ["unicorn"]
