FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git \
    && git clone https://github.com/sheran/dpart-mediadl.git /go/src/github.com/sheran/dpart-mediadl

WORKDIR /go/src/github.com/sheran/dpart-mediadl
RUN go build -o /go/bin/mediadl

FROM alpine:latest

RUN apk update && apk add --no-cache yt-dlp
COPY yt-dlp.conf /etc
COPY --from=builder /go/bin/mediadl /app/mediadl
COPY --from=builder /go/src/github.com/sheran/dpart-mediadl/static /app/static
WORKDIR /app
ENTRYPOINT [ "/app/mediadl" ]

