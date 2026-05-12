# Lab Walkthrough: Directory Services

> **Full PDF with screenshots:** [Directory_Services.pdf](../lab-docs/Directory_Services.pdf)
> **Section page:** [Directory Services](../docs/02-directory-services.md)

---

## Goal

Rename both virtual machines, install the AD DS role, promote the server to a Domain Controller, set up the `as.bank` forest, and join the Windows 11 workstation to the domain.

---

## Steps

1. Open both the Windows Server 2025 and Windows 11 Workstation virtual machines in your virtualization software.
2. Click the Search bar on the Server and type `sysdm.cpl` to open the System Properties applet.
3. In the "Computer Name/Domain Changes" window, change the Server name to `asS1` and the Workstation name to `asW1`. Ensure both are still members of the "WORKGROUP" at this stage.
4. In Server Manager, click "Add roles and features" to open the wizard.
5. Scroll down and check the box for **Active Directory Domain Services**.
6. Leave the default features selected (such as Group Policy Management) and click **Next**.
7. Review the installation selections and click **Install**.
8. Select **"Promote this server to a domain controller"** from the notification flag.
9. You will see the Deployment Configuration screen.
10. Select **"Add a new forest"** and enter your root domain name as `as.bank`.
11. Leave the default domain controller options, set a DSRM password, and proceed through the wizard.
12. Review the installation selections and click **Install**. The server will restart automatically.
13. After rebooting, confirm that AD DS and DNS roles appear in the Server Manager sidebar.
14. Open the Search bar and look for **"Active Directory Users and Computers"** to verify the directory structure is live.
15. Expand the `as.bank` domain to see the default containers like "Builtin," "Computers," and "Users".
16. Select the **"Domain Controllers"** container.
17. Confirm that `asS1` is listed as a Global Catalog (GC) server in the Domain Controllers organizational unit.
18. On the Workstation, open Command Prompt and run `ipconfig /all` to check your current IP and DNS settings.
19. Return to the Workstation and open the System Properties naming window again.
20. Click **"Change,"** select **"Domain,"** and type `as.bank`.
21. When prompted, enter the domain administrator credentials.
22. A **"Welcome to the as.bank domain"** success message will pop up confirming the join was successful.
23. The workstation will restart automatically.
24. Log in using the domain account `administrator@as.bank` to prove the systems are networked.
