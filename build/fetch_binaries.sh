#!/usr/bin/env bash
set -euo pipefail

ARCH=$(uname -m)
case $ARCH in
    x86_64)
        ARCH=amd64
        ;;
    aarch64)
        ARCH=arm64
        ;;
esac

get_grpcurl() {
  case "$ARCH" in
    "arm"*)
      echo "echo grpcurl does not yet support arm" > /tmp/grpcurl && chmod +x /tmp/grpcurl
      ;;
    *)
      VERSION=1.8.1
      if [ "$ARCH" == "amd64" ]; then
        TERM_ARCH=x86_64
      else
        TERM_ARCH="$ARCH"
      fi
      url="https://github.com/fullstorydev/grpcurl/releases/download/v${VERSION}/grpcurl_${VERSION}_linux_${TERM_ARCH}.tar.gz"
      wget "$url" -O /tmp/grpcurl.tar.gz && \
      tar -zxvf /tmp/grpcurl.tar.gz && \
      mv "grpcurl" /tmp/grpcurl && \
      chmod +x /tmp/grpcurl
      ;;
  esac
}

get_grpcurl
