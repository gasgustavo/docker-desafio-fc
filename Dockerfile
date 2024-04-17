FROM golang:1.22 AS builder
WORKDIR /go/app
COPY . .
RUN go build -o myapp main.go

FROM scratch
WORKDIR /go/app
COPY --from=builder /go/app/myapp .
CMD [ "./myapp" ]