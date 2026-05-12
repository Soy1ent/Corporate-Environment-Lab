# DHCP

> **Lab walkthrough:** [Step-by-step instructions](../appendices/09-lab-dhcp.md) · [Full PDF with screenshots](../lab-docs/DHCP.pdf)

---

## Why DHCP Matters

Dynamic Host Configuration Protocol (DHCP) is a critical service within the Across the States Bank network infrastructure, and its value becomes especially apparent when examined through the lens of **administrative overhead**.

In an enterprise environment with approximately 2,000 employees distributed across five branch locations, the task of assigning and maintaining IP address configurations for every workstation, printer, and networked device would be unmanageable if done manually.

## The Manual Alternative — And Why It Falls Apart

Static IP assignment requires an administrator to individually configure each device with:

- An IP address
- A subnet mask
- A default gateway
- DNS server information

The administrator then has to track and update those assignments whenever hardware changes, devices are added, or address conflicts arise. At the scale of a bank, that quickly becomes impossible to maintain accurately.

## How DHCP Solves the Problem

DHCP eliminates that burden entirely by automating the process from a centralized server. When a device joins the network, it requests an address, and the DHCP server responds with a full configuration drawn from a preconfigured scope — in this case the `172.13.100.0` range covering all bank workstations.

Fitzgerald et al. (2022) describe DHCP as one of the core mechanisms by which large organizations reduce the cost and complexity of network management, noting that automated address assignment also reduces the human error that frequently leads to address conflicts and connectivity failures.

## What That Means for Across the States Bank

For Across the States Bank, this means:

- **Zero-touch onboarding** — Onboarding a new workstation at any branch requires no manual network configuration from IT staff.
- **Centralized scope management** — Changes such as adding a new DNS server or adjusting the default gateway can be pushed from the corporate DHCP server and will automatically propagate to all clients upon their next lease renewal.
- **Operational consistency** — The result is a network that is both easier to maintain and more consistent in its configuration across every location, which directly supports the bank's operational stability and compliance posture.

---

## What I Built in the Lab

I installed the DHCP Server role on `asS1`, authorized it in Active Directory, and created an active scope:

| Setting | Value |
|---|---|
| Scope name | workstations |
| IP range | 172.13.100.1 – 172.13.255.254 |
| Subnet mask | 255.255.0.0 |
| Default gateway | 172.13.0.1 |
| DNS server | asS1 (172.13.0.1) |
| Domain | as.bank |

Then I switched to `asW1`, ran `ipconfig /release` and `ipconfig /renew`, and watched the workstation pull a fresh lease from the DHCP server.

---

## Reference

- Fitzgerald, J., Dennis, A., & Durcikova, A. (2022). *Business data communications and networking* (14th ed.). Wiley.
