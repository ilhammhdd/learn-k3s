ARG ARCH=

FROM --platform=${ARCH} golang:1.16-alpine AS build

RUN apk update && apk upgrade

WORKDIR /go/src/github.com/ilhammhdd/learn-k3s/
COPY . /go/src/github.com/ilhammhdd/learn-k3s/

RUN go mod tidy
RUN go build -o learn_k3s_app

FROM --platform=${ARCH} alpine

ARG HTTP_PORT
ARG DOMAIN
ENV HTTP_PORT=${HTTP_PORT}
ENV DOMAIN=${DOMAIN}

COPY --from=build /go/src/github.com/ilhammhdd/learn-k3s/learn_k3s_app .

EXPOSE ${HTTP_PORT}

ENTRYPOINT ./learn_k3s_app