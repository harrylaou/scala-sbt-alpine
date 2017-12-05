FROM  frolvlad/alpine-scala
MAINTAINER harrylaou@gmail.com
ENV SCALA_VERSION=2.12.4
ENV SBT_VERSION=1.0.3

RUN \
  echo "$SCALA_VERSION $SBT_VERSION" && \
  apk add --no-cache bash && \
  apk add --no-cache curl && \
  apk add --no-cache bc && \
  scala -version && \
  scalac -version

RUN \
  curl -fsL https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local
RUN \
  $(mv /usr/local/sbt-launcher-packaging-$SBT_VERSION /usr/local/sbt || true)
RUN \
  ln -s /usr/local/sbt/bin/* /usr/local/bin/
RUN \
  sbt sbtVersion
