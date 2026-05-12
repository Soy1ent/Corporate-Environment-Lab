# Backup and Restore

> **Lab walkthrough:** [Step-by-step instructions](../appendices/10-lab-backup-restore.md) · [Full PDF with screenshots](../lab-docs/Backup_and_Restore.pdf)

---

## Why This Matters for a Bank

Financial institutions depend on their servers to process transactions, store customer records, and maintain regulatory compliance around the clock. A server failure without a proper backup strategy can bring these operations to a standstill within minutes.

The consequences extend far beyond a temporary outage. They include:

- Permanent data loss
- Legal liability
- Lasting damage to customer trust

## Regulatory Pressure

Banks are particularly vulnerable to data loss because they operate under strict regulatory frameworks that require accurate record-keeping and rapid recovery capabilities.

Regulators such as the **FDIC** and **OCC** hold financial institutions accountable for maintaining data integrity, meaning that a failure to recover critical systems in a timely manner can result in significant fines and sanctions.

Beyond compliance, customers expect uninterrupted access to their accounts, and any disruption erodes confidence in the institution.

## The Threat Landscape

The threats that make backups necessary are varied and increasingly sophisticated:

- **Ransomware** has become a primary concern for the financial sector, with attackers encrypting server data and demanding payment before restoration.
- **Hardware failures**, **human error**, and **natural disasters** present additional risks that no organization is immune to.

Without verified, tested backups stored in a secure and separate location, recovery from any of these events becomes either extremely costly or outright impossible.

## What a Real Backup Policy Looks Like

A structured backup policy addresses these risks by ensuring that recent copies of critical data are always available for restoration.

Krause (2022) stresses that a reliable backup strategy must include:

- **Regular scheduling** — backups happen automatically, not when someone remembers
- **Offsite or cloud storage** — a fire or flood can't take out the primary and the backup at the same time
- **Routine restoration testing** — a backup that has never been restored is just an untested assumption

For a bank, this is an operational necessity that protects clients, employees, and the institution itself.

---

## What I Built in the Lab

For the lab I demonstrated two recovery scenarios that map to two very different real-world failures:

1. **Active Directory Recycle Bin** — enabled at the domain level, used to recover accidentally deleted user accounts without needing a full restore. Fast object-level recovery for the common case.
2. **Windows Server Backup — System State Restore** — used after taking a full backup and then booting the server into Safe Mode. Full recovery from a catastrophic failure.

Together these cover both the daily "oops, I deleted the wrong user" scenario and the worst-case "the whole DC just died" scenario.

---

## Reference

- Krause, J. (2022). *Mastering Windows Server 2022* (4th ed.). Packt Publishing.
