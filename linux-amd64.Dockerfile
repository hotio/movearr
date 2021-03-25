FROM golang:alpine as builder

ARG VERSION

RUN apk add --no-cache git build-base && \
    git clone -n https://github.com/l3uddz/movearr.git /movearr && cd /movearr && \
    git checkout ${VERSION} -b hotio && \
    make && \
    chmod 755 /movearr/dist/movearr_linux_amd64/movearr

FROM alpine@sha256:4266485e304a825d82c375d3584121b53c802e3540d6b520b212a9f0784d56f5
ENTRYPOINT ["movearr"]
COPY --from=builder /movearr/dist/movearr_linux_amd64/movearr /usr/local/bin/
