FROM alpine:3 AS builder

WORKDIR /build

RUN apk add --no-cache curl tar
RUN curl -sSL https://www.mumble.info/downloads/linux-static-server | tar xj --strip 1

FROM alpine:3

COPY --from=builder /build/murmur.ini /templates/murmur.ini
COPY --from=builder /build/murmur.x86 /usr/local/bin/murmur
COPY ./start.sh /usr/local/bin/murmur-wrapper
RUN chmod +x /usr/local/bin/murmur-wrapper

VOLUME /data

EXPOSE 64738/tcp
EXPOSE 64738/udp

USER 1000

ENTRYPOINT ["/usr/local/bin/murmur-wrapper"]
