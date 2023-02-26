VERSION=0.0.1
DIR_SRC=./cmd/pairup
BIN=pairup
CMD_DOCKER=docker

GO_ENV=CGO_ENABLED=0 GO111MODULE=on
GO=$(GO_ENV) $(shell which go)

generate:
	@$(GO) generate ./...
	@$(GO) mod tidy

build: generate
	@$(GO) build -o $(BIN) $(DIR_SRC)

clean:
	@rm -rf $(BIN)

all: clean build

test:
	@$(GO) test -v ./...