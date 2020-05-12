FROM golang:alpine AS builder
WORKDIR /app/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build cmd/hello-world/main.go

FROM gcr.io/distroless/base
WORKDIR /app/
COPY --from=builder /app/main .
CMD ["./main"]