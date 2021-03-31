FROM golang:alpine as builder

ARG VERSION

RUN apk add --no-cache git build-base && \
    git clone -n https://github.com/l3uddz/movearr.git /movearr && cd /movearr && \
    git checkout ${VERSION} -b hotio && \
    make && \
    chmod 755 /movearr/dist/movearr_linux_amd64/movearr

FROM alpine@sha256:e103c1b4bf019dc290bcc7aca538dc2bf7a9d0fc836e186f5fa34945c5168310
ENTRYPOINT ["movearr"]
COPY --from=builder /movearr/dist/movearr_linux_amd64/movearr /usr/local/bin/
