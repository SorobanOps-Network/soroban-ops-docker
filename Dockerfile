# syntax=docker/dockerfile:1
# Use an explicit, slim Rust base image for reproducibility and small attack surface
FROM rust:1.80.0-slim-bookworm

# DevSecOps: Link image to repository for automated GHCR README syncing
LABEL org.opencontainers.image.source="https://github.com/SorobanOps-Network/soroban-ops-docker"
LABEL org.opencontainers.image.description="Containerized execution sandbox for SorobanOps profiling"
LABEL org.opencontainers.image.licenses="MIT"

# DevSecOps: Create dedicated unprivileged system group and user with fixed UID/GID for execution safety
RUN groupadd --gid 10001 sorobanops && \
    useradd --uid 10001 --gid sorobanops --shell /bin/bash --create-home sorobanops

# Set and secure the working directory with explicit ownership
WORKDIR /app
RUN chown -R sorobanops:sorobanops /app /home/sorobanops

# Configure compiler cache environment variables for BuildKit acceleration
ENV SCCACHE_DIR=/root/.cache/sccache

# Leverage Docker BuildKit cache mounts to preserve compiler state across local image rebuilds
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/root/.cache/sccache \
    cargo --version

# Switch execution context to the unprivileged non-root user
USER sorobanops

# Default command
CMD ["bash"]