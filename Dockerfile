FROM alpine:3 AS builder

WORKDIR /build

RUN apk add --no-cache curl tar
RUN curl -sSL https://dl.mumble.info/latest/stable/server-linux-x86 | tar xj --strip 1

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
