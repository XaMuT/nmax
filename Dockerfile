FROM ruby:2.3.3

ENV APP_PATH=/srv/nmax \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/usr/local/bundle

RUN echo 'gem: --no-rdoc --no-ri' > /etc/gemrc
RUN mkdir -p $APP_PATH

WORKDIR $APP_PATH

COPY . $APP_PATH

RUN gem install bundler && bundle install

CMD /bin/bash
