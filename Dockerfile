# Use an explicit, slim Rust base image for reproducibility and small attack surface
FROM rust:1.80.0-slim-bookworm

# DevSecOps: Link image to repository for automated GHCR README syncing
LABEL org.opencontainers.image.source="https://github.com/SorobanOps-Network/soroban-ops-docker"
LABEL org.opencontainers.image.description="Containerized execution sandbox for SorobanOps profiling"
LABEL org.opencontainers.image.licenses="MIT"

# DevSecOps: Create a non-root user to run pipeline operations securely
RUN useradd -m -s /bin/bash sorobanops

# Set and secure the working directory
WORKDIR /app
RUN chown -R sorobanops:sorobanops /app

# Switch context to the non-root user
USER sorobanops

# Default command
CMD ["bash"]