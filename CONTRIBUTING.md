# Contributing to Soroban-Ops Docker

Welcome to the infrastructure wing of Soroban-Ops! This repository hosts the Docker configurations required to spin up isolated Stellar environments.

## Drips Wave Participants
1. Claim an issue from the `Issues` tab.
2. Fork the repository and create a branch: `feature/issue-number-brief-desc`
3. Modify the Docker configurations or bash scripts.
4. Test your changes locally.
5. Submit a Pull Request referencing the original issue.

## Testing Guidelines
Never submit a PR without testing the container boot cycle:
```bash
docker-compose -f docker/docker-compose.standalone.yml up -d
./scripts/healthcheck.sh
docker-compose down
```