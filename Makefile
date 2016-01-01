.PHONY: \
	build \
	server \
	clean

build:
	mkdir -p out
	cp -r src/nginx/* src/assets/ out
	cd src/lua && moonc -t ../../out/ ./*

watch:
	mkdir -p out
	cd src/lua && moonc -w -t ../../out/ ./*

server:
	cd out && \
	lapis server development

clean:
	rm -rf out
