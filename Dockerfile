FROM golang:1.16 as builder

WORKDIR /go/src/app
COPY . .

RUN go mod tidy
RUN go get -d
RUN go build -o app .

FROM scratch
WORKDIR /root/
COPY --from=builder /go/src/app .
CMD ["./app"]