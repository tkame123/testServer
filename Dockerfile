FROM golang:1.11-alpine as goapp
ENV APP_ROOT /go/src/app
WORKDIR $APP_ROOT
ADD main.go $APP_ROOT

RUN go build main.go

FROM alpine:latest
COPY --from=goapp /go/src/app/main .
# この環境変数が必要
ENV PORT 8080
EXPOSE 8080
CMD ["./main"]