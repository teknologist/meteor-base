FROM ubuntu:16.04
MAINTAINER The Teknologist <teknologist@gmail.com>

USER root
RUN apt-get update \
  && apt-get dist-upgrade -y \
        && apt-get install -y --no-install-recommends \
                ca-certificates curl graphicsmagick openssh-client \
                numactl locales bzip2 build-essential python git libc6 libncurses5 libstdc++6 lib32z1 lib32stdc++6 \
                libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev build-essential g++ libc6-dev phantomjs pdftk\
        && rm -rf /var/lib/apt/lists/* && \
    apt-get clean 
    
RUN useradd -ms /bin/bash meteor
USER meteor
RUN curl https://install.meteor.com/ | sh && npm -g install npm@latest-2
RUN npm install -g velocity-cli gulp node-gyp
