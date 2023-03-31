.PHONY: build
build:
	docker build --no-cache -t ubuntu-nix -f ./Dockerfile .

.PHONY: run
run:
	docker run -it --rm -v $(shell pwd):/repo -e NIX_USER_CONF_FILES=/repo/nix.conf --workdir /repo ubuntu-nix:latest /bin/bash
