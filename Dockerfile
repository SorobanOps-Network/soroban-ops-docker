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

# Switch execution context to the unprivileged non-root user
USER sorobanops

# Default command
CMD ["bash"]