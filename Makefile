.PHONY: build-latest
build-latest:
	@./buildVersionTag latest $(push)

# Build with specific ubuntu version and tag with <ubuntu-version>-nix<nix-version>
# make build-versioned ubuntu=22.10 push=true
.PHONY: build-versioned
build-versioned:
	@./buildVersionTag $(ubuntu) $(push)

.PHONY: run
run:
	docker run -it --rm -v $(shell pwd):/repo -e NIX_USER_CONF_FILES=/repo/nix.conf --workdir /repo tateexon/nix-ubuntu:latest /bin/bash
