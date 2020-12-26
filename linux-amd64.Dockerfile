FROM golang:alpine as builder

ARG VERSION

RUN apk add --no-cache git build-base && \
    git clone -n https://github.com/l3uddz/movearr.git /movearr && cd /movearr && \
    git checkout ${VERSION} -b hotio && \
    make && \
    chmod 755 /movearr/dist/movearr_linux_amd64/movearr

FROM alpine@sha256:074d3636ebda6dd446d0d00304c4454f468237fdacf08fb0eeac90bdbfa1bac7
ENTRYPOINT ["movearr"]
COPY --from=builder /movearr/dist/movearr_linux_amd64/movearr /usr/local/bin/
