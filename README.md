# Soroban-Ops Infrastructure (Docker)

This repository provides the standalone Soroban local node network setups. It is designed to be used as a dependent step in CI environments or by local developers looking for a turn-key simulation sandbox for Stellar smart contracts.

##  Quick Start (Usage)

When using your tools inside your personal smart contract repository, you can implement by formatting your workflow file like this:

```yaml
# Example workflow inside a target contract repository using our tools
steps:
- name: Checkout Target Contract Code
  uses: actions/checkout@v4

- name: Boot Soroban-Ops Infrastructure Node Network
  run: |
    # Pull down the compose file from our infrastructure repository
    curl -sSL [https://raw.githubusercontent.com/SorobanOps-Network/soroban-ops-docker/main/docker/docker-compose.standalone.yml](https://raw.githubusercontent.com/SorobanOps-Network/soroban-ops-docker/main/docker/docker-compose.standalone.yml) -o docker-compose.yml
    docker-compose up -d
    
- name: Run Profile Analyzer Reporting Action
  # Invoke our custom action repository cleanly as a native extension dependency
  uses: SorobanOps-Network/soroban-ops-action@v1
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
```
### Local Testing
Run ```./scripts/healthcheck.sh``` after running ```docker-compose -f docker/docker-compose.standalone.yml up -d``` to verify the node is accepting **RPC** connections.  

