---
name: "Wave Issue - Medium: [Multi-Version Engine Configuration Matrix]"
about: Expand the compose orchestrator to accept runtime target arguments dynamically
title: "TASK: Introduce Dynamic Image Tag Arguments to Compose Configurations"
labels: ["drips-wave", "complexity:medium"]
assignees: []
---

### Problem Statement
The current `docker-compose.standalone.yml` target is locked directly to the `latest` tag of the `stellar/quickstart` image. Developers need to test against specific core upgrades.

### Acceptance Criteria
- [ ] Refactor `docker/docker-compose.standalone.yml` to replace `image: stellar/quickstart:latest` with an environment variable interpolation pattern (`image: stellar/quickstart:${STELLAR_IMAGE_TAG:-latest}`).
- [ ] Update documentation instructions in the `README.md` clarifying variable assignment patterns.

### Done When
Executing `STELLAR_IMAGE_TAG=soroban-v21.0.0 docker-compose up` pulls and initializes the targeted version smoothly.