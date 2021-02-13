FROM golang:alpine as builder
ARG VERSION
RUN wget -O /usr/local/bin/movearr "https://github.com/l3uddz/movearr/releases/download/v${VERSION}/movearr_v${VERSION}_linux_amd64" && \
    chmod 755 /usr/local/bin/movearr

FROM alpine@sha256:3747d4eb5e7f0825d54c8e80452f1e245e24bd715972c919d189a62da97af2ae
ENTRYPOINT ["movearr"]
COPY --from=builder /usr/local/bin/movearr /usr/local/bin/movearr
