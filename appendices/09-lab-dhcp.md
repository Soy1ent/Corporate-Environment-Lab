# Lab Walkthrough: DHCP

> **Full PDF with screenshots:** [DHCP.pdf](../lab-docs/DHCP.pdf)
> **Section page:** [DHCP](../docs/09-dhcp.md)

---

## Goal

Install the DHCP Server role on `asS1`, authorize it in Active Directory, configure a scope for the workstation subnet (`172.13.100.0`), and verify that the workstation pulls a lease automatically.

---

## Part 1: Install the DHCP Role

1. Click **"Add roles and features"** in Server Manager to open the wizard and get started installing DHCP.
2. Check the box next to **"DHCP Server"** in the list of server roles to select it for installation.
3. Review the confirmation page showing DHCP Server and its tools are ready to install, then click **Install**.
4. Watch the installation progress screen as Windows begins installing the DHCP Server role.
5. See the installation finish successfully and click **"Complete DHCP configuration"** to set up the server.
6. See the Server Manager Dashboard now shows a DHCP tile, confirming the role was installed.

## Part 2: Authorize the DHCP Server in AD

7. Notice the yellow warning flag at the top of Server Manager. Click it to see the post-deployment notification to complete DHCP configuration.
8. Complete the **DHCP Authorization** step by using the current `AS\administrator` credentials to authorize the DHCP server in Active Directory.
9. See the Summary page confirm that security groups were created and the DHCP server was authorized successfully.

## Part 3: Configure the Scope

10. Confirm that DHCP is activated by checking the DHCP tab on the left.
11. Open the **DHCP management console** from the Tools menu. See the server `ass1.as.bank` listed in the left panel.
12. Expand the server in the DHCP console to see the IPv4 and IPv6 sections ready to be configured.
13. Click the **Action** menu at the top and select **"New Scope"** to start creating a range of IP addresses for the server to hand out.
14. See the New Scope Wizard open to the Scope Name page, ready for you to type a name for this scope.
15. Type **"workstations"** as the scope name and **"End users"** as the description, then click **Next**.
16. Enter the IP address range for the scope: starting at `172.13.100.1` and ending at `172.13.255.254` with a subnet mask of `255.255.0.0`.
17. Choose **"Yes, I want to configure these options now"** to set up the gateway, DNS, and other settings right away.
18. Enter the parent domain as `as.bank` and the DNS server name as `asS1` with IP address `172.13.0.1`, then click **Add**.
19. Choose **"Yes, I want to activate this scope now"** so the DHCP server can immediately start handing out IP addresses.
20. See the new "workstations" scope now appears in the DHCP console with a status of **Active**.

## Part 4: Verify on the Workstation

21. Switch to the workstation machine and log in as an administrator on the Windows login screen.
22. Open **Command Prompt** and run `ipconfig /release` to drop the current IP address, then start typing `ipconfig /renew`.
23. Run `ipconfig /renew` and see the client is assigned IP address `172.13.100.1` from the DHCP server.
24. Run `ipconfig /all` from the other VM to see the full network details, confirming DHCP is enabled and the lease was obtained from the server at `172.13.0.1`.
