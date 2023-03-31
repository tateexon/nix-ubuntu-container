FROM public.ecr.aws/ubuntu/ubuntu:latest
ARG NIX_VERSION=2.14.1
ENV NIX_PATH=nixpkgs=channel:nixos-unstable
COPY ./nixInstall ./nixInstall
RUN apt-get update && apt-get install -y wget xz-utils gpg openssl bash sudo curl git \
    && ./nixInstall \
    && rm ./nixInstall \
    && apt-get clean all
ENV PATH="/nix/var/nix/profiles/default/bin:/root/.nix-profile/bin:${PATH}"
