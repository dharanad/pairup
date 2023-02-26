# Stage #1 Build project binary
FROM golang:1.20-alpine AS golang-builder

ARG GOPROXY
ENV GOPROXY ${GOPROXY:-direct}

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PACKAGE github.com/dharanad/pairup
ENV BUILD_DIR ${GOPATH}/src/${PACKAGE}

COPY . ${BUILD_DIR}
WORKDIR ${BUILD_DIR}

RUN apk --no-cache add build-base git
RUN make all
RUN cp pairup /usr/bin/pairup

# Stage #2
FROM alpine

COPY --from=golang-builder /usr/bin/pairup /usr/bin/pairup

EXPOSE 80
ENTRYPOINT ["/usr/bin/pairup"]