# Group Policies

> **Lab walkthrough:** [Step-by-step instructions](../appendices/06-lab-group-policies.md) · [Full PDF with screenshots](../lab-docs/Group_Policy.pdf)

---

## What Group Policy Is

Group Policy is a feature of Microsoft Windows Server environments that enables administrators to define and enforce specific configurations, behaviors, and security settings across all computers and users within an Active Directory domain.

Rather than configuring each workstation individually, Group Policy allows centralized management through **Group Policy Objects (GPOs)**, which are containers of settings linked to sites, domains, or organizational units (OUs) within Active Directory. When a computer or user authenticates to the domain, the applicable GPOs are downloaded and applied automatically, ensuring consistent enforcement of organizational standards without requiring manual intervention at each endpoint.

## Why GPOs Matter for a Bank

For Across the States Bank, Group Policy serves as a foundational security and compliance mechanism that directly supports the institution's regulatory obligations.

The banking industry operates under strict regulatory frameworks, including:

- **Gramm-Leach-Bliley Act (GLBA)** — requires safeguards to protect customer data
- **Federal Financial Institutions Examination Council (FFIEC)** guidelines — mandate technical safeguards across financial institutions

Group Policy supports compliance with these requirements by enforcing:

- Password complexity rules
- Automatic screen lock timeouts
- Login warning banners that establish legal notice prior to system access

Each of these configurations is documented, reproducible, and auditable — qualities that are essential during regulatory examinations.

## Reducing the Attack Surface

Group Policy also reduces the attack surface available to both external threats and malicious insiders:

- **Disabling the Command Prompt** and removing the Run line from the Start Menu limits the ability of unauthorized users to execute scripts outside of approved applications.
- **Removing the last logged-on username** from the login screen prevents credential enumeration, a common reconnaissance technique where attackers learn valid usernames before attempting to crack them.
- **Software deployment through GPO** ensures that every workstation runs approved versions of required applications, eliminating inconsistencies that can introduce security vulnerabilities.

For a financial institution operating across multiple states, this level of centralized control is essential. Group Policy allows Across the States Bank to fulfill its legal obligations and protect the clients it serves.

---

## What I Built in the Lab

I configured 10 GPOs covering the full range of bank security requirements:

| GPO | Purpose |
|---|---|
| Password Policy | Complexity, length, lockout, history |
| Lock Screen After 10 Minutes | Idle timeout with password resume |
| Interactive Logon Banner | Legal notice before login |
| Remove Last-Logged on User | Prevents credential enumeration |
| Disable CMD | Restricted to Domain Admins only |
| Desktop Background | Standard ASB wallpaper |
| Drive Mapping | Auto-mapped department drives |
| Folder Redirection | Desktop and Documents to network share |
| Chrome Install | Software deployment via GPO |
| Search Bar | User preference standardization |

---

## References

- Microsoft. (2023). Group Policy overview. Microsoft Learn. https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/group-policy/group-policy-overview
