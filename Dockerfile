FROM golang:1.14 AS builder
ENV CGO_ENABLED 0
WORKDIR /go/src/app
ADD . .
RUN go build -mod vendor -o /merge-env-to-ini

FROM alpine:3.12
COPY --from=builder /merge-env-to-ini /merge-env-to-ini
CMD ["/merge-env-to-ini"]