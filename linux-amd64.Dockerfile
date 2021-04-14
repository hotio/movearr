FROM golang:alpine as builder

ARG VERSION

RUN apk add --no-cache git build-base && \
    git clone -n https://github.com/l3uddz/movearr.git /movearr && cd /movearr && \
    git checkout ${VERSION} -b hotio && \
    make && \
    chmod 755 /movearr/dist/movearr_linux_amd64/movearr

FROM alpine@sha256:def822f9851ca422481ec6fee59a9966f12b351c62ccb9aca841526ffaa9f748
ENTRYPOINT ["movearr"]
COPY --from=builder /movearr/dist/movearr_linux_amd64/movearr /usr/local/bin/
