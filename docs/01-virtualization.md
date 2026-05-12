# Windows Server Virtualization

> **Lab walkthrough:** [Step-by-step instructions](../appendices/01-lab-virtualization.md) · [Full PDF with screenshots](../lab-docs/Windows_Server_Virtualization.pdf)

---

## Why Windows Server and Windows 11

In the proposed corporate environment for Across the States Bank, Windows Server 2025 and Windows 11 are the primary tools used to keep our financial operations running securely. By using Windows Server as our main hub, we can manage all employee user accounts and security rules from one central spot, while Windows 11 gives our staff a secure and familiar desktop to work on day-to-day.

## Why Virtualization Matters for a Bank

Virtualization is key for a bank like ours because modern server hardware is so powerful that a single task rarely uses its full potential. Instead of wasting that extra capacity, we use virtualization software to split one physical server into several virtual ones that act independently.

This gives us a few real advantages:

- **Smart resource management** — we can schedule when the CPU is used so no computing power is wasted
- **Snapshots** — these act as backups of a system, meaning workloads can be swiftly migrated between servers without any downtime for customers
- **Isolation** — each virtual machine acts on its own, so a problem in one doesn't automatically spread to others

The operating system of a computer is essentially the "brain" that lets the hardware communicate to the software. By handling backend work like managing the hard drive and memory, the banking servers' software is able to run without crashing.

## Security Considerations

Security risks can be mitigated through complex passwords and virtualization-based security to defend sensitive financial data. Due to the sensitivity of this data, virtualization management should be limited and restricted to authorized administrators only (Scarfone & Souppaya, 2011).

## Type 1 vs. Type 2 Hypervisors

There are two main types of virtualization architectures:

- **Type 1 hypervisors** run directly on the hardware and are the most stable choice for main bank data centers.
- **Type 2 hypervisors** run on top of an existing operating system.

VMware Workstation Pro, which I used for this project, is a Type 2 (hosted) hypervisor because it runs on top of my existing Windows operating system. While Type 1 is better for massive server rooms, Type 2 is incredibly flexible for setting up and testing our bank's network before we go live.

For Across the States Bank, a professional virtualization setup ensures our data stays safe and our systems stay fast.

---

## References

- Krause, J. (2022). *Mastering Windows Server 2022* (4th ed.). Packt Publishing.
- Scarfone, K., Souppaya, M., & Hoffman, P. (2011). *Guide to Security for Full Virtualization Technologies* (NIST SP 800-125). NIST. https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-125.pdf
