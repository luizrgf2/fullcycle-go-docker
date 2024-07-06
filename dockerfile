FROM golang:1.22 AS build

WORKDIR /app

COPY . .

RUN go build -o app

FROM scratch

WORKDIR /app

COPY --from=build /app/app .

CMD ["./app"]