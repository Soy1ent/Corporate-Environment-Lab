# Server Roles

> **Topology diagram:** [v2 — Server Roles](../network-design/topo2-server-roles.pdf)

---

## How Information Systems Fit Together

Building a business's information systems requires organizing system administration, database management, and programming into a single clear process from the initial setup to final deployment.

- **System administration** provides the foundation by setting up and securing servers such as a Linux or Windows Server. It manages user permissions, controls services, configures firewall settings, and maintains backups and logs to keep the system stable and secure.
- **Database management** organizes how business data is stored and retrieved by designing structured tables, creating primary and foreign keys, enforcing rules to protect data accuracy, and writing efficient SQL queries in systems like MySQL.
- **Programming** ties all these together by using languages such as Python or PowerShell to implement the application's logic and handle user interaction in a secure and reliable way.

Showing skill in all three areas means you can effectively design and manage a system that grows with a business's needs (FitzGerald et al., 2020).

---

## The Servers

### Directory Services (`CO-DC01`)
This server manages the users and groups that can access computers across the network. Using Active Directory, it ensures that only authorized bank employees can log into workstations and access sensitive financial documents (Lenovo, n.d.). This server's information is then replicated to the RODC servers at each of the branches.

### Remote Domain Controller Server (`BR-RODC01`)
For enhanced security each bank has its own RODC, which holds a non-writable copy of the Active Directory database. So if an attacker were to steal the physical server they wouldn't be able to access administrative credentials. It also adds redundancy — if the site-to-site tunnel to the corporate office fails, bankers are still able to authenticate and access local resources such as each branch's file server (WindowsTechno, n.d.).

### DNS Server (`CO-DNS01`)
The DNS is necessary for translating IP addresses. Without a DNS, internal services and internet connectivity would be impossible since computers would not know where to send packets. It is located at the corporate office, and as a core service it must be close to the Domain Controller for integrated security (Limoncelli et al., 2016).

### DHCP Server (`CO-DHCP01`)
This server automates the distribution of IP addresses to the many devices in the network. It prevents manual errors or conflicts if every bank workstation had to be configured by hand. It is held at the corporate office, since IP scopes for the entire corporation can be managed from a single interface.

### File Sharing Server (`CO-FS01` and `BR-FS01`)
A file server is meant as a secure vault for sensitive documents such as loans, customer IDs, and other banking files. Its purpose is to centralize these critical resources so they are not scattered over multiple hard drives. It is also where regular backups will be stored as all the servers are onsite and not in the cloud. Each bank branch also has its own local file server, since the multitude of documents would clog traffic across the bank's network if everything ran through corporate.

### Point of Sale Server (`CO-POS01`)
POS systems are necessary, especially for a bank, because they process and record sales and provide receipts. The reason on-site would be more advantageous than cloud is because of security control and the ability to access it without an internet connection. By keeping it central at the corporate office, it allows for easier audit logs necessary to meet global anti-money laundering and regulatory compliance standards (Crassula, 2025).

### Email Server (`CO-MAIL01`)
The purpose of an email server is to handle internal communication and customer notifications. Since email is the standard for formal business records and is required for legal compliance and auditing in the banking sector, it is absolutely needed. Hosting this internally at the corporate office (rather than in the cloud) gives the bank total control over the privacy and encryption of sensitive financial communications.

### Web Server (`CO-WEB01`)
The bank's web server is for internal employee intranet and the public-facing banking portal. It is the primary interface for both the staff and customers to interact with the bank's services. While at the corporate office, it is logically placed in a **DMZ (Demilitarized Zone)**. This keeps public web traffic isolated from the sensitive internal bank network to prevent breaches.

### Database Server (`CO-DB01`)
The purpose of a database server is to hold the bank's information system. By keeping all data in one central location, the bank ensures that every branch sees the same information at the same time. This avoids issues such as a customer trying to withdraw an amount from two different branches at once (Crassula, 2025).

---

## References

- BleepingComputer. (2024, November 4). Windows Server 2025 released: Here are the new features. https://www.bleepingcomputer.com/news/microsoft/windows-server-2025-released-here-are-the-new-features/
- Crassula. (2025, December 16). Core banking database design: Key principles & best practices. https://crassula.io/blog/core-banking-database-design/
- FitzGerald, J., Dennis, A., & Durcikova, A. (2020). *Business data communications and networking* (14th ed.). Wiley.
- Krause, J. (2022). *Mastering Windows Server 2022* (4th ed.). Packt Publishing.
- Lenovo. (n.d.). What is a domain controller? https://www.lenovo.com/us/en/glossary/domain-controller/
- NetSuite. (2021, May 19). Point of sale (POS) defined: How it works & why it's important. https://www.netsuite.com/portal/resource/articles/ecommerce/point-of-sale-POS.shtml
- WindowsTechno. (n.d.). What is RODC (read-only domain controller)? https://windowstechno.com/what-is-rodc-read-only-domain-controller/
