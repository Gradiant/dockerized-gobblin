FROM openjdk:8u171-jdk-alpine3.7 as builder
ARG VERSION=0.14.0

RUN apk add --no-cache bash git
RUN git clone https://github.com/apache/incubator-gobblin.git

# build gobblin
RUN apk add --no-cache bash && \
    cd /incubator-gobblin && git checkout tags/release-$VERSION && \
    ./gradlew build -x findbugsMain -x test -Pversion=$VERSION


FROM openjdk:8u171-jre-alpine3.7 as gobblin
LABEL maintainer="cgiraldo@gradiant.org"
LABEL organization="gradiant.org"
ARG VERSION=0.14.0
ENV VERSION=$VERSION
ENV GOBBLIN_WORK_DIR /root
ENV GOBBLIN_FWDIR /gobblin-dist
ENV GOBBLIN_JOB_CONFIG_DIR /etc/gobblin


COPY --from=builder /incubator-gobblin/apache-gobblin-incubating-bin-$VERSION.tar.gz /
RUN apk add --no-cache bash libc6-compat && mkdir -p /etc/gobblin && tar -xvzf /apache-gobblin-incubating-bin-$VERSION.tar.gz
COPY files/ /gobblin-dist/

ENTRYPOINT ["/gobblin-dist/bin/gobblin-standalone.sh", "start"]


