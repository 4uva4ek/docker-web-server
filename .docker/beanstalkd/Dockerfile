FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN  apt-get update \
    && apt-get install -y beanstalkd

VOLUME ["/binlog"]
EXPOSE 11300
CMD ["beanstalkd", "-V", "-p", "11300", "-b", "/binlog"]