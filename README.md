# Across the States Bank — Corporate IT Infrastructure Portfolio

**Author:** Cameron Bert
**Course:** ITT-121 — Grand Canyon University
**Duration:** January 2026 – May 2026
**Environment:** VMware Workstation Pro · Windows Server 2025 · Windows 11 · Ubuntu Server 24.04.4
**Domain:** `as.bank`

---

## About This Project

Across the States Bank (ASB) is a fictional bank I designed and built the IT infrastructure for over the course of a semester. The goal was to take a proposed corporate environment from a written design all the way through to a working virtualized network — with a domain controller, real user accounts, department file shares, group policies, DHCP, security auditing, and a full backup and restore process.

The whole environment runs on VMware Workstation Pro using a Windows Server 2025 machine (`asS1`) as the domain controller and a Windows 11 workstation (`asW1`) joined to the `as.bank` domain. The bank has approximately 2,000 employees spread across one corporate office and five branches, so everything was designed to scale to that size.

This repo holds the written proposal, the lab walkthroughs (with screenshots), the PowerShell scripts I used to provision the environment, and the network topology diagrams that evolved across the project.

---

## Why This Matters for a Cybersecurity Degree

A lot of cybersecurity work depends on actually understanding the infrastructure you're trying to defend. Before you can detect a threat on a domain controller, you have to know what a domain controller does, how Active Directory works, and where the logs come from. This project builds that foundation hands-on.

Concretely, this portfolio shows:

- **Active Directory and identity management** — designing OU structures, building security groups, and provisioning over 2,000 user accounts at scale
- **Group Policy enforcement** — turning written security policy into actual technical controls (password rules, screen locks, login banners, drive mapping, software deployment)
- **Security auditing and threat detection** — using Windows Event Viewer, audit policies, and a honeypot to catch unauthorized access attempts
- **Network design** — segmenting traffic, planning IP ranges, and isolating guest/IoT traffic from corporate systems
- **Hybrid OS environments** — knowing when Windows is the right choice and when Linux is a better fit for security and licensing reasons
- **Compliance awareness** — aligning the design with real banking regulations like GLBA, FFIEC, FDIC, and OCC

For someone going into cybersecurity, this is the kind of project that demonstrates you can read a system the way an attacker or a defender would, because you've built one yourself.

---

## Project Sections

| # | Section | Type | Walkthrough |
|---|---|---|---|
| 1 | [Windows Server Virtualization](./docs/01-virtualization.md) | Written + Lab | [PDF](./lab-docs/Windows_Server_Virtualization.pdf) |
| 2 | [Directory Services](./docs/02-directory-services.md) | Written + Lab | [PDF](./lab-docs/Directory_Services.pdf) |
| 3 | [Server Roles](./docs/03-server-roles.md) | Written | — |
| 4 | [Account Management](./docs/04-account-management.md) | Written + Lab | [PDF](./lab-docs/Account_Management.pdf) |
| 5 | [Windows and Linux Integration](./docs/05-linux-integration.md) | Written | — |
| 6 | [Group Policies](./docs/06-group-policies.md) | Written + Lab | [PDF](./lab-docs/Group_Policy.pdf) |
| 7 | [Audit Common Threats](./docs/07-audit-threats.md) | Written + Lab | [PDF](./lab-docs/Audit_Common_Threats.pdf) |
| 8 | [Security Guidelines](./docs/08-security-guidelines.md) | Written (Policy) | — |
| 9 | [DHCP](./docs/09-dhcp.md) | Written + Lab | [PDF](./lab-docs/DHCP.pdf) |
| 10 | [Backup and Restore](./docs/10-backup-restore.md) | Written + Lab | [PDF](./lab-docs/Backup_and_Restore.pdf) |

---

## Repo Layout

| Folder | What's In It |
|---|---|
| [`/docs`](./docs/) | The 10 written section files |
| [`/lab-docs`](./lab-docs/) | The full step-by-step PDF walkthroughs with screenshots |
| [`/appendices`](./appendices/) | Markdown versions of the lab steps (for quick reading on GitHub) |
| [`/scripts`](./scripts/) | The two PowerShell scripts I wrote — share/OU/group provisioning and bulk user creation |
| [`/network-design`](./network-design/) | Topology diagrams showing how the network changed across the project |

---

## Topology Evolution

The network design grew across three stages — one for each major phase of the project:

| Version | Phase | What Changed |
|---|---|---|
| [v1 — Virtualization](./network-design/topo1-virtualization.pdf) | Initial topology | Core servers, dual UTMs, switching, branch site |
| [v2 — Server Roles](./network-design/topo2-server-roles.pdf) | Expanded | Added full server role inventory with OS assignments |
| [v3 — Linux Integration](./network-design/topo3-linux-integration.pdf) | Final | Moved Email, Web, and Database servers to Ubuntu 24.04.4 |

---

## Scripts

| Script | What It Does |
|---|---|
| [`foldersOUsUsergroups.ps1`](./scripts/foldersOUsUsergroups.ps1) | Builds the entire departmental file share, OU, and security group structure in one run |
| [`usercreation.ps1`](./scripts/usercreation.ps1) | Bulk-creates 2,097 Active Directory user accounts across 10 departments using `dsadd` |

---

## References

- Krause, J. (2022). *Mastering Windows Server 2022* (4th ed.). Packt Publishing.
- Scarfone, K., Souppaya, M., & Hoffman, P. (2011). *Guide to Security for Full Virtualization Technologies* (NIST SP 800-125). NIST.
- FitzGerald, J., Dennis, A., & Durcikova, A. (2020). *Business Data Communications and Networking* (14th ed.). Wiley.
- Microsoft. (2023). Group Policy overview. Microsoft Learn.
