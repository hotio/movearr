FROM golang:alpine as builder
ARG VERSION
RUN wget -O /usr/local/bin/movearr "https://github.com/l3uddz/movearr/releases/download/v${VERSION}/movearr_v${VERSION}_linux_amd64" && \
    chmod 755 /usr/local/bin/movearr

FROM alpine@sha256:e103c1b4bf019dc290bcc7aca538dc2bf7a9d0fc836e186f5fa34945c5168310
ENTRYPOINT ["movearr"]
COPY --from=builder /usr/local/bin/movearr /usr/local/bin/movearr
