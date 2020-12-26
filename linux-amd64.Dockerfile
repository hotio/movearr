FROM golang:alpine as builder
ARG VERSION
RUN wget -O /usr/local/bin/movearr "https://github.com/l3uddz/movearr/releases/download/v${VERSION}/movearr_v${VERSION}_linux_amd64" && \
    chmod 755 /usr/local/bin/movearr

FROM alpine@sha256:074d3636ebda6dd446d0d00304c4454f468237fdacf08fb0eeac90bdbfa1bac7
ENTRYPOINT ["movearr"]
COPY --from=builder /usr/local/bin/movearr /usr/local/bin/movearr
