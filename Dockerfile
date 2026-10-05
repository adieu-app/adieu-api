FROM golang:1.22-alpine AS build
WORKDIR /src
COPY go.mod ./
COPY . .
RUN CGO_ENABLED=0 go build -o /adieu-api .

FROM gcr.io/distroless/static-debian12
COPY --from=build /adieu-api /adieu-api
EXPOSE 8080
ENTRYPOINT ["/adieu-api"]
