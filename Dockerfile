FROM node:9-stretch

RUN apt-get update \
    && apt-get -y install imagemagick \
    && rm /var/lib/apt/lists/* -fR

RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz \
    && tar -xvf ImageMagick.tar.gz \
    && cd ImageMagick-7.* \
    && ./configure \
    && make \
    && make install \
    && ldconfig /usr/local/lib

#RUN groupadd -g 991 misskey \
#    && useradd -u 991 -g misskey -m misskey

COPY ./misskey /misskey
#COPY ./config/default.yml /misskey/.config/default.yml

#RUN chown misskey:misskey -R /misskey

#USER misskey
WORKDIR /misskey

RUN cd /misskey \
    && npm install \
    && npm install web-push -g \
    && npm install -g node-gyp \
    && node-gyp configure \
    && node-gyp build

CMD ["npm", "start"]
EXPOSE 3000
