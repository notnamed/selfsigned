FROM alpine
RUN apk update && apk add bash openssl
ADD . /usr/src
WORKDIR /usr/src
ENTRYPOINT /usr/src/init.sh
