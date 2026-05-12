# Windows and Linux Integration

> **Topology diagram:** [v3 — Linux Integration (Final)](../network-design/topo3-linux-integration.pdf)

---

## Why Run Both Systems

Windows and Linux each serve distinct roles in a modern enterprise network, and financial institutions commonly run both together to take advantage of what each system does well in its own respect.

**Windows Server** is built around Active Directory, Group Policy, and tightly integrated Microsoft services, making it a reliable choice for administrators managing a large number of user accounts and workstations in an environment like banking (Krause, 2022).

**Linux** provides stability, lower licensing costs, and a smaller attack surface for public-facing and data-heavy server roles. Economides and Katsamakas (2006) note that Linux has fewer security flaws per thousand lines of code, which is extremely important in an industry subject to strict compliance requirements such as finance.

## The Recommended Configuration for ASB

The recommended configuration for Across the States Bank is a **hybrid deployment** of both Windows and Linux servers.

**Windows Server 2025** should run:
- The domain controllers
- The DHCP server
- The DNS server
- Both file servers

These roles depend heavily on Active Directory integration, Group Policy, and Windows-native authentication, making Windows Server the appropriate platform for them (Krause, 2022).

**Ubuntu Server** should run:
- The web server
- The database server
- The email server

Open-source software stacks are well-supported on Linux, and the reduced attack surface helps secure servers that handle sensitive workloads (Urilski et al., 2024).

Keeping the two environments integrated through Active Directory allows administrators to manage user accounts from a single interface while still taking advantage of Linux's stability and lower licensing costs on the servers where it matters most.

---

## Server-by-Server Breakdown

### Web Server (`CO-WEB01`)
The web server hosts both the internal employee intranet and the public-facing banking portal, placing it in the DMZ where it is logically separated from the internal Windows network. Running this server on Linux with **NGINX** is a well-supported option. La Lau (2021) describes NGINX on Enterprise Linux as a performant and security-hardened option for exactly this kind of financial environment. Because the web server does not need to integrate with Active Directory services directly, there is no operational reason to keep it on Windows, and moving it to Linux reduces the overall Windows licensing footprint.

### Database Server (`CO-DB01`)
The database server holds the bank's core information system, including customer accounts and transaction records. Linux is the dominant operating system for enterprise database hosting due to its stability under sustained load and its lower resource overhead compared to Windows Server. Urilski et al. (n.d.) found that Linux server environments report significantly fewer recorded vulnerabilities than their Windows counterparts, which directly supports using Linux for a server that contains the most sensitive data in the organization.

### Email Server (`CO-MAIL01`)
The email server manages internal communication and customer notifications and must meet legal compliance and audit requirements. Linux-based mail platforms are mature and widely used in enterprise settings. Banoth and Godishala (2026) discuss how Linux architecture supports the configuration control needed in security-conscious environments. Hosting the mail server on Linux gives the bank direct control over encryption and logging without depending on additional Windows licensing.

---

## References

- Banoth, R., & Godishala, A. K. (2026). The Windows operating system, Linux overview. In *Building a secure infrastructure: The key concepts*. Springer.
- Economides, N., & Katsamakas, E. (2006). Linux vs. Windows: A comparison of application and platform innovation incentives for open source and proprietary software platforms. In *The economics of open source software development*. Elsevier.
- Krause, J. (2022). *Mastering Windows Server 2022* (4th ed.). Packt Publishing.
- La Lau, R. (2021). Web server part 1: Apache/Nginx basics. In *A secure and well-secured enterprise class internet server*. Springer.
- Urilski, A., Hristev, R., & Todorova, E. (n.d.). Enhancing the security and efficiency migration from Windows Server to Linux Server: Resource analysis and benefits. ResearchGate.
