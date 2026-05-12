# Network Design

The network topology evolved across three stages of the project. Each PDF in this folder corresponds to one stage.

| Version | Stage | What Changed |
|---|---|---|
| [`topo1-virtualization.pdf`](./topo1-virtualization.pdf) | v1 — Windows Server Virtualization | Initial topology with core servers, dual UTMs, L3/L2 switching, and branch site |
| [`topo2-server-roles.pdf`](./topo2-server-roles.pdf) | v2 — Server Roles | Server key expanded with full role list and OS assignments |
| [`topo3-linux-integration.pdf`](./topo3-linux-integration.pdf) | v3 — Linux Integration | Email, Web, and Database servers moved to Ubuntu 24.04.4 |

---

## Network Summary

| Location | Endpoints | Connectivity |
|---|---|---|
| Corporate Office (Metropolis, CA) | 275 | Dual fiber-optic uplinks, redundant UTM firewalls |
| 5 Branch Offices (combined) | 75 | DSL modem, single UTM, site-to-site VPN to corporate |

## Corporate VLAN Plan

| VLAN | Name | Subnet | Gateway |
|---|---|---|---|
| 10 | DATA | 10.0.10.0/24 | 10.0.10.1 |
| 20 | MGMT | 10.0.20.0/24 | 10.0.20.1 |
| 30 | VOIP | 10.0.30.0/24 | 10.0.30.1 |
| 40 | WIFI | 10.0.40.0/24 | 10.0.40.1 |
| 92 | GUEST-WIFI | 10.0.92.0/22 | 10.0.92.1 |
| 999 | BLACKHOLE | (no IP) | — |

## Branch VLAN Plan

| VLAN | Name | Subnet | Gateway |
|---|---|---|---|
| 10 | DATA | 10.1.10.0/24 | 10.1.10.1 |
| 96 | GUEST-WIFI | 10.1.96.0/22 | 10.1.96.1 |

## Final Server Key (v3)

| Hostname | Role | OS |
|---|---|---|
| CO-DHCP01 | DHCP Server | Windows Server 2025 |
| CO-DNS01 | DNS Server | Windows Server 2025 |
| CO-DC01 | Domain Controller / Directory Services | Windows Server 2025 |
| CO-FS01 | File Sharing Server | Windows Server 2025 |
| CO-POS01 | Point of Sale Server | Windows Server 2025 |
| CO-MAIL01 | Email Server | Ubuntu Server 24.04.4 |
| CO-WEB01 | Web Server | Ubuntu Server 24.04.4 |
| CO-DB01 | Database Server | Ubuntu Server 24.04.4 |
| BR-RODC01 | Remote Domain Controller (branch) | Windows Server 2025 |
| BR-FS01 | File Sharing Server (branch) | Windows Server 2025 |
