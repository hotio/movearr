FROM golang:alpine as builder
ARG VERSION
RUN wget -O /usr/local/bin/movearr "https://github.com/l3uddz/movearr/releases/download/v${VERSION}/movearr_v${VERSION}_linux_amd64" && \
    chmod 755 /usr/local/bin/movearr

FROM alpine@sha256:4266485e304a825d82c375d3584121b53c802e3540d6b520b212a9f0784d56f5
ENTRYPOINT ["movearr"]
COPY --from=builder /usr/local/bin/movearr /usr/local/bin/movearr
