FROM ubuntu:16.04
MAINTAINER thom.nichols@voltserver.com

ENV DEBIAN_FRONTEND noninteractive
ENV OCTAVE_VERSION 4.2.1
ENV DISPLAY=unix:0
# Use: -v /tmp/.X11-unix:/tmp/.X11-unix

ADD files/ /
ADD install.sh install.sh
RUN sh ./install.sh && rm install.sh
RUN useradd -ms /bin/bash octave
ADD *.m /home/octave/
RUN chown -R octave:octave /home/octave/

USER octave
WORKDIR /source

VOLUME ["/source"]
ENTRYPOINT ["octave", "--no-gui"]
# use --entrypoint
