FROM alpinelinux/alpine-gitlab-ci:latest as builder

ARG ALPINE_VERSION=v3.14

ENV ALPINE_VERSION=$ALPINE_VERSION

COPY build.sh /usr/local/bin/build.sh
COPY --chown=1000 . /tmp/aports

RUN ash /usr/local/bin/build.sh

FROM scratch

COPY --from=builder /home/buildozer/out/* /
