#!/usr/bin/env bash
cd "$(dirname "$0")" || exit 1
docker build -t mycelium-mkdocs-material .
docker run --rm -it \
  -p 8080:8000 \
  -v "$(pwd)":/docs \
  mycelium-mkdocs-material
