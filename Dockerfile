FROM golang:1.15-alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -ldflags "-s -w" ./app.go

FROM scratch

COPY --from=builder /usr/src/app/app .

CMD ["./app"]