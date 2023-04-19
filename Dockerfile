FROM golang:alpine

WORKDIR /go/src/app
COPY . .

RUN go mod init fullcycle
RUN go build -o /go/bin/app

FROM scratch

COPY --from=0 /go/bin/app /go/bin/app

CMD ["/go/bin/app"]