.PHONY: init

init:
	docker run --rm -v "${PWD}":/work cgr.dev/chainguard/melange keygen

bun-apk:
	docker run --privileged --rm -v "${PWD}":/work \
	  cgr.dev/chainguard/melange build templates/bun/melange.yml \
	  --arch aarch64 \
	  --signing-key melange.rsa

bun-image:
	docker run --rm --workdir /work -v ${PWD}:/work cgr.dev/chainguard/apko \
	  build templates/bun/apko.yml bun-application:0.1.0 bun-application.tar --arch host
	find . -name "sbom*" -exec rm {} \;
	docker load < bun-application.tar
	docker image ls | grep bun-application
