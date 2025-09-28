# melange-apko

A collection of templates for building applications using
[melange](https://github.com/chainguard-dev/melange) and
[apko](https://github.com/chainguard-dev/apko).

## Current Templates

- [bun](templates/bun)

## Usage

Before using the templates, ensure you have a container runtime installed. Then
run: `make init`. This will generate required rsa keys for signing packages.

Then to build packages and their respective container images, you can run:

```bash
make <template-name>-apk
make <template-name>-image
```

This will build packages into the /packages directory and then load the resultant
tar into your container runtime.
