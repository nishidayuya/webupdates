FROM ruby:3.1.2-alpine3.16
MAINTAINER Yuya.Nishida.

RUN set -x && \
  mkdir /tmp/t01 && \
  cd /tmp/t01 && \
  \
  apk add --no-cache firefox && \
  \
  GECKODRIVER_VERSION=0.31.0 && \
  wget "https://github.com/mozilla/geckodriver/releases/download/v$GECKODRIVER_VERSION/geckodriver-v$GECKODRIVER_VERSION-linux64.tar.gz" && \
  tar xf "geckodriver-v$GECKODRIVER_VERSION-linux64.tar.gz" && \
  chmod a+x geckodriver && \
  mv -fv geckodriver /usr/local/bin/ && \
  \
  gem install webg --no-document --version=0.3.0 && \
  \
  rm -rf /tmp/t01

COPY webupdates /usr/local/bin/
ENV DATA_PATH /var/lib/webupdates
ENTRYPOINT ["/usr/local/bin/webupdates"]
