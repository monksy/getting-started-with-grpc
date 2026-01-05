# Makefile for building the project

.PHONY: help protos client server

help:
	@echo "Available commands:"
	@echo "  make protos      # Generate protobuf files"
	@echo "  make clean       # Cleans up the output files"
	@echo "  make client      # Build client binary"
	@echo "  make server      # Build server binary"


clean:
	@echo "Removing the out folder"
	@rm -rf "./out"

protos:
	@echo "Generating protobuf files..."
	@rm -rf "./ecommerce/example.local"
	@protoc -I proto --go_out=./ecommerce --go_opt=paths=source_relative \
		--go-grpc_out=./ecommerce --go-grpc_opt=paths=source_relative \
	   proto/product_info.proto

tidy_all:
	@echo "Tidying Modules"
	@cd client && go mod tidy
	@cd service && go mod tidy

client: protos tidy_all
	@echo "Building client..."
	@rm -f ./out/client/client && cd client && go build -o ../out/client/client

server: protos tidy_all
	@echo "Building server..."
	@rm -f ./out/server/server && cd service && go build -o ../out/server/server
