ARG UBUNTU_VERSION=latest

FROM public.ecr.aws/ubuntu/ubuntu:${UBUNTU_VERSION}
ENV NIX_PATH=nixpkgs=channel:nixos-unstable
COPY ./nixInstall ./nixInstall
COPY ./direnvAllow /direnvAllow
RUN apt-get update && apt-get install -y wget xz-utils gpg openssl bash sudo curl git \
    && ./nixInstall \
    && rm ./nixInstall \
    && apt-get clean all \
    && curl -sfL https://direnv.net/install.sh | bash \
    && echo "/direnvAllow" >> ~/.bashrc
ENV PATH="/nix/var/nix/profiles/default/bin:/root/.nix-profile/bin:${PATH}"
