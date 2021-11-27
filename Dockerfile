FROM httpd:alpine as builder
WORKDIR /root
RUN apk update && apk upgrade && apk add git bash openssh && git clone https://github.com/KAR0218/KAR0218.github.io.git

FROM httpd:alpine
COPY --from=builder /root/KAR0218.github.io/* /usr/local/apache2/htdocs/
RUN apk add --no-cache tzdata

EXPOSE 8080/tcp