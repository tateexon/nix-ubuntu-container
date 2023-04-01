# Ubuntu docker with nix installed

Based on: https://github.com/cachix/install-nix-action/blob/master/install-nix.sh
and how that installs nix for github actions

You can build the image from scratch by running

```bash
make build-latest
```

You can then run it locally to use nix in your local repository with

```bash
docker run -it --rm -v $(pwd):/repo -e NIX_USER_CONF_FILES=/repo/nix.conf --workdir /repo tateexon/nix-ubuntu:latest /bin/bash
```