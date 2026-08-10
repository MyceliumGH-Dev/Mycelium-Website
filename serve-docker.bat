@echo off
docker build -t mycelium-mkdocs-material .
docker run --rm -it -p 8080:8000 -v "%cd%":/docs mycelium-mkdocs-material
