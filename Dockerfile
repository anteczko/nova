FROM debian:latest
MAINTAINER s21@onet.pl

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq htop
RUN apt-get clean

#CMD ["ls", "-l"]

WORKDIR /root
ENV DZ versionl

ADD run.sh /root/run.sh
RUN ["chmod","+x","/root/run.sh"]
CMD ["./run.sh"]

ENTRYPOINT ["./run.sh"]
CMD ["arg1"]

RUN ["apt-get","install","git","-y"]
RUN ["git","clone","https://github.com/anteczko/donger/"]
RUN ["chmod","+x","/root/donger/script.sh"]
RUN ["/root/donger/script.sh"]
