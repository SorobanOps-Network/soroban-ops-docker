---
name: "Wave Issue - Trivial: [Document Exposed Ports]"
about: Add comments to the compose file detailing exposed RPC ports.
title: "TASK: Document RPC and Horizon Ports in Compose Config"
labels: ["drips-wave", "complexity:trivial", "good first issue"]
assignees: []
---

### Problem Statement
Contributors booting the standalone node need to know which ports are exposed to the host machine without reverse-engineering the compose file.

### Acceptance Criteria
- [ ] Add inline comments in `docker/docker-compose.standalone.yml` above the `ports` mapping explaining that `8000` is the Soroban RPC port.
- [ ] Ensure the YAML syntax remains valid.

### Done When
The compose file clearly comments the exposed networking ports and still boots successfully via `docker-compose up`.