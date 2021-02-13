FROM golang:alpine as builder

ARG VERSION

RUN apk add --no-cache git build-base && \
    git clone -n https://github.com/l3uddz/movearr.git /movearr && cd /movearr && \
    git checkout ${VERSION} -b hotio && \
    make && \
    chmod 755 /movearr/dist/movearr_linux_amd64/movearr

FROM alpine@sha256:3747d4eb5e7f0825d54c8e80452f1e245e24bd715972c919d189a62da97af2ae
ENTRYPOINT ["movearr"]
COPY --from=builder /movearr/dist/movearr_linux_amd64/movearr /usr/local/bin/
