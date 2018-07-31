FROM node:9-stretch

RUN apt-get update \
    && apt-get -y install git \
    && rm /var/lib/apt/lists/* -fR

#RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz \
#    && tar -xvf ImageMagick.tar.gz \
#    && cd ImageMagick-7.* \
#    && ./configure \
#    && make \
#    && make install \
#    && ldconfig /usr/local/lib


#COPY ./misskey /misskey
RUN git clone https://github.com/syuilo/misskey.git /misskey

WORKDIR /misskey

RUN cd /misskey \
#    && git reset --hard 17bb349 \
    && npm install \
    && npm install web-push -g \
    && npm install -g node-gyp \
    && node-gyp configure \
    && node-gyp build

CMD ["npm", "start"]
EXPOSE 3000
