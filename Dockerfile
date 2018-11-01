FROM alpine:latest
MAINTAINER Phil Schatzmann <pschatzmann@gmail.com>
RUN apk update && apk add openjdk8 unzip wget
WORKDIR /opt
RUN  wget http://h2o-release.s3.amazonaws.com/h2o/latest_stable -O latest && \
  wget --no-check-certificate -i latest -O /opt/h2o.zip 
RUN unzip h2o.zip && rm h2o.zip && mv h2o* h2o
WORKDIR /opt/h2o
EXPOSE 54321
CMD java -jar h2o.jar
