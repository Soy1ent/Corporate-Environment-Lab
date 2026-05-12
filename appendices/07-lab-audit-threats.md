# Lab Walkthrough: Audit Common Threats

> **Full PDF with screenshots:** [Audit_Common_Threats.pdf](../lab-docs/Audit_Common_Threats.pdf)
> **Section page:** [Audit Common Threats](../docs/07-audit-threats.md)

---

## Goal

Build a HoneyPot GPO with advanced audit policies, set up the `payroll` folder as a decoy, simulate an unauthorized access attempt from a regular user, and use Event Viewer to detect and analyze the access through Security event logs.

---

## Part 1: Initial Server State

1. Notice the server is locked. The Windows lock screen shows the time and date.
2. Type the administrator password to log into the server.
3. See the desktop load after a successful login, showing the wallpaper.

## Part 2: Create the HoneyPot GPO

4. Open **Group Policy Management** to see the existing policies applied to the `as.bank` domain.
5. Right-click the domain and select **"Create a GPO in this domain"** from the menu.
6. Name the new Group Policy Object **"HoneyPot"** and click OK.

## Part 3: Set Up the Payroll Folder as the Decoy

7. Check the Sharing tab to confirm the payroll folder is shared on the network at `\\ASS1\payroll`.
8. Open the Security tab to see which groups have permission to access the payroll folder.
9. Add the **Users** group and give it **Full Control** permission to the payroll folder.
10. Confirm the Users group now appears in the permissions list with full access.
11. Add the **Everyone** group to the permissions list with full access as well.
12. Access the payroll folder from the workstation on the network and see that it shows up.

## Part 4: Configure Advanced Audit Policies

13. Open the HoneyPot GPO in the editor to see the Computer Configuration settings.
14. Navigate to **Object Access** audit subcategories and see that all are set to "Not Configured."
15. Select **"Audit File System"** and highlight it, ready to configure.
16. Set **Audit File System** to log both **Successes and Failures**, then click Apply.
17. Open Command Prompt and run `gpupdate /force` to apply the new policy right away.
18. Open the HoneyPot GPO editor again and navigate to the **Computer Configuration** section.
19. Find the **Advanced Audit Policies** section and see all categories are still "Not configured."
20. Under **Detailed Tracking**, set **"Audit Process Termination"** to log successes.
21. Under **System**, set **"Audit Security System Extension"** to log successes only.
22. Review the audit policy summary and see most categories now show "Configured," meaning the honeypot is set up.

## Part 5: Trigger and Detect the Intrusion

23. Suspend the `asS1` virtual machine in VMware.
24. Open **Computer Management** to access Event Viewer, which records system activity.
25. Click on **Event Viewer** and wait for it to load a summary of recent system events.
26. Open the **Security** log.
27. Filter the log by **Event IDs 4656 and 4663** to find file access attempts.
28. See the filtered results showing 4 events where user `Aaron..Kirkland` tried to access the payroll folder.
29. Open the full event details to see `Aaron..Kirkland`'s account info and the time the access happened.
30. Find the **HoneyPot GPO** in the Group Policy Management list and right-click it to see its options.
