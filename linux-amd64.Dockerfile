FROM golang:alpine as builder
ARG VERSION
RUN wget -O /usr/local/bin/movearr "https://github.com/l3uddz/movearr/releases/download/v${VERSION}/movearr_v${VERSION}_linux_amd64" && \
    chmod 755 /usr/local/bin/movearr

FROM alpine@sha256:4661fb57f7890b9145907a1fe2555091d333ff3d28db86c3bb906f6a2be93c87
ENTRYPOINT ["movearr"]
COPY --from=builder /usr/local/bin/movearr /usr/local/bin/movearr
