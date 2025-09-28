.PHONY: init, bun, bun-apk, bun-image, go, go-apk, go-image

init:
	docker run --rm -v "${PWD}":/work cgr.dev/chainguard/melange keygen

bun:
	./bin/build.sh bun apk
	./bin/build.sh bun image
bun-apk:
	./bin/build.sh bun apk
bun-image:
	./bin/build.sh bun image

go:
	./bin/build.sh go apk
	./bin/build.sh go image
go-apk:
	./bin/build.sh go apk
go-image:
	./bin/build.sh go image
