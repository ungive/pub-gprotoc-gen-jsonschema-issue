.PHONY: build

all:

bin/protoc-gen-jsonschema:
	git submodule update --init --recursive
	mkdir -p bin
	cd protoc-gen-jsonschema &&\
		go build -o ../bin/protoc-gen-jsonschema ./main.go

build: bin/protoc-gen-jsonschema
	protoc \
		--plugin=protoc-gen-jsonschema=./bin/protoc-gen-jsonschema \
		--jsonschema_out=. \
		--jsonschema_opt=entrypoint_message=Message \
		-I ./protoc-gen-jsonschema \
		-I . \
		./issue.proto
