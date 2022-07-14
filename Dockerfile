FROM golang as builder
WORKDIR /usr/scr/app
COPY hello-world.go .
RUN go build hello-world.go

FROM scratch
WORKDIR /usr/scr/app
COPY --from=builder /usr/scr/app/hello-world .
CMD [ "./hello-world" ]