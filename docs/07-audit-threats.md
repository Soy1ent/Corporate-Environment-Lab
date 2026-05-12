# Audit Common Threats

> **Lab walkthrough:** [Step-by-step instructions](../appendices/07-lab-audit-threats.md) · [Full PDF with screenshots](../lab-docs/Audit_Common_Threats.pdf)

---

## Why Auditing Is Foundational

Auditing is a foundational component of any sound cybersecurity defense strategy, particularly within a regulated financial institution such as Across the States Bank.

**Security auditing** refers to the systematic review of event logs, user activity, and system configurations to detect unauthorized access, policy violations, and anomalous behavior across the corporate network.

Windows Server 2025 provides native auditing capabilities through Group Policy, allowing administrators to track:

- Logon events
- Object access
- Account management changes
- Privilege use

These events are logged across all domain-joined machines. The logs generate a reliable, time-stamped record of system activity that supports both incident response and regulatory compliance with standards such as the Gramm-Leach-Bliley Act.

According to Krause (2022), configuring audit policies within Active Directory is one of the most direct methods available for detecting lateral movement and insider threats before they escalate into a full breach.

## Going Beyond Standard Logging — The Honeypot

Beyond standard log collection, a properly deployed **honeypot** extends the bank's detection capabilities by creating a deliberately exposed decoy system designed to attract and record malicious activity.

To implement a honeypot effectively within a corporate environment, several preparatory tasks must be completed:

### 1. Isolation
The honeypot must be isolated from production systems using a separate virtual machine or network segment with strict firewall rules that prevent any traffic from crossing into the live environment.

### 2. Dedicated Audit GPO
Administrators must configure a dedicated Group Policy Object that enables detailed auditing on the honeypot machine, capturing all logon attempts, process creation events, and object access in the Security event log.

### 3. Realistic Decoy Content
The decoy system should be populated with realistic but fictitious data, such as fake loan documents or placeholder customer records, so that any interaction with those resources is immediately flagged as suspicious.

### 4. Real-Time Alerting
Real-time alerting must be established so that any access to the honeypot triggers an automated notification to the security team rather than relying on periodic log review.

### 5. SIEM Integration
All collected honeypot data should be forwarded to a centralized **Security Information and Event Management (SIEM)** solution, where it can be correlated with broader network activity and retained for forensic analysis.

Together, routine auditing and a well-configured honeypot form a proactive detection layer that significantly reduces the window of time between intrusion and response.

---

## What I Built in the Lab

For the lab I created a HoneyPot GPO that:

- Enabled **Audit File System** for both success and failure events
- Enabled **Audit Process Termination** under Detailed Tracking
- Enabled **Audit Security System Extension** under System

I then set up a `payroll` folder on the server and gave it broad access to act as the decoy. To test detection, I logged in as a regular user (`Aaron..Kirkland`) and tried to access the folder. The Security log immediately showed **Event IDs 4656 and 4663** capturing 4 access attempts, with the username, timestamp, and source computer all logged.

This is exactly how the bank would catch an insider threat in production.

---

## Reference

- Krause, J. (2022). *Mastering Windows Server 2022* (4th ed.). Packt Publishing.
