# Directory Services

> **Lab walkthrough:** [Step-by-step instructions](../appendices/02-lab-directory-services.md) · [Full PDF with screenshots](../lab-docs/Directory_Services.pdf)

---

## Network Carving Table

| Device Category | IP Address Range | Purpose |
|---|---|---|
| Active Directory Servers | 172.13.0.1 – 172.13.0.50 | Primary and Backup Domain Controllers (DNS/AD) |
| Financial/App Servers | 172.13.0.51 – 172.13.1.254 | Banking applications and database servers |
| Network Infrastructure | 172.13.2.1 – 172.13.5.254 | Management IPs for Routers, Core Switches, and APs |
| Banking Peripherals | 172.13.6.1 – 172.13.10.254 | ATM interfaces, receipt printers, and scanners |
| Corporate Workstations | 172.13.100.1 – 172.13.150.254 | Primary staff desktop fleet (Static/DHCP) |
| Guest/Wireless IoT | 172.13.200.1 – 172.13.254.254 | Public Wi-Fi and smart building devices (Isolated) |

---

## Why Active Directory Is the Center of the Network

When designing an infrastructure for Across the States Bank, network engineers need a strong understanding of how enterprise systems manage identity and access. At the center of the environment is Active Directory (AD), which functions as the control plane of the network.

By promoting a Windows Server 2025 system to a Domain Controller, we create a single, centralized authority for managing user accounts, computers, and banking resources across the organization.

## What AD Does for the Bank

Active Directory is critical because it enforces a consistent security model across the entire domain. When Windows 11 workstations such as `asW1` are joined to the `as.bank` forest, access to sensitive financial data is restricted to authenticated, domain-managed users.

This centralized authentication and authorization model allows the bank to support roughly 2,000 employees across five branch locations without requiring dedicated IT staff at each site. As noted by Krause (2022), understanding and properly configuring these server roles is foundational to scalable identity and access management in enterprise environments.

## Virtualization and AD Together

The infrastructure also relies heavily on virtualization, which is especially important in a banking context. Physical servers are rarely used to their full capacity, and virtualization allows multiple server roles to run on a single host while remaining logically isolated. This improves resource efficiency and simplifies backup, recovery, and disaster response.

This design aligns with NIST Special Publication 800-125 (Scarfone et al., 2011), which identifies virtualization as a core mechanism for improving system security through isolation. Combined with carefully segmented network subnets, this approach results in an infrastructure that is efficient, manageable, and resilient against common threats in the financial sector.

---

## References

- Krause, J. (2022). *Mastering Windows Server 2022* (4th ed.). Packt Publishing.
- Scarfone, K., Souppaya, M., & Hoffman, P. (2011). *Guide to Security for Full Virtualization Technologies* (NIST SP 800-125). NIST. https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-125.pdf
