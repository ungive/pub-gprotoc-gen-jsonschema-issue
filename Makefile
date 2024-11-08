.PHONY: build

all:

bin/protoc-gen-jsonschema:
	git submodule update --init --recursive
	mkdir -p bin
	cd protoc-gen-jsonschema &&\
		go build -o ../bin/protoc-gen-jsonschema ./main.go

build_py: bin/protoc-gen-jsonschema
	mkdir -p build_py
	protoc \
		--python_out=build_py \
		-I ./protoc-gen-jsonschema \
		-I ./ \
		./issue.proto \
		./protoc-gen-jsonschema/jsonschema.proto

build: bin/protoc-gen-jsonschema
	protoc \
		--plugin=protoc-gen-jsonschema=./bin/protoc-gen-jsonschema \
		--jsonschema_out=. \
		--jsonschema_opt=entrypoint_message=Message \
		-I ./protoc-gen-jsonschema \
		-I . \
		./issue.proto

clean:
	rm -rf bin
	rm -rf build_py
