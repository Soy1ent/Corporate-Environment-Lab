# Lab Walkthrough: Account Management

> **Full PDF with screenshots:** [Account_Management.pdf](../lab-docs/Account_Management.pdf)
> **Section page:** [Account Management](../docs/04-account-management.md)
> **Scripts:** [`foldersOUsUsergroups.ps1`](../scripts/foldersOUsUsergroups.ps1) · [`usercreation.ps1`](../scripts/usercreation.ps1)

---

## Goal

Plan the departmental structure, run the provisioning script to build the file shares, OUs, and security groups, set NTFS permissions, bulk-create 2,097 users with `dsadd`, and verify access from the workstation.

---

## Part 1: Plan and Setup

1. Outline the list of departments needed within your proposed environment.
2. Start your virtualization software.
3. Sign into the Windows Server machine as Administrator.

## Part 2: Run the Provisioning Script

4. Open PowerShell on the Server and run `foldersOUsUsergroups.ps1` to create all share folders, OUs, and security groups in one pass.
5. Name the top-level folder `shares` and verify it has been created under the `C:` drive.
6. Confirm all OUs have been created with corresponding folders that have been shared to the network.

## Part 3: Configure NTFS Permissions

7. Go to shares and select `accounting`, then open Properties.
8. Click **Sharing**, go to **Advanced Sharing**, and open **Permissions**.
9. Add **Everyone** with Full Control at the share level.
10. Under the **Security** tab, select **Edit** and add the following groups to each department folder:
    - The matching department security group (Read & Execute only)
    - The `executives` group (Read only)
    - `Domain Admins` (Full Control)
11. Repeat these permission steps for each department folder.
12. Open File Explorer to the shared folders on the server and verify department folders like `accounting`, `hr`, and `sales` are present.
13. Open the `accounting` folder and confirm it is empty.
14. Create a new folder called `payroll` inside the accounting share.

## Part 4: Bulk User Creation

15. Open a list of users in an Excel file.
16. Copy all the users.
17. Copy and paste the entire spreadsheet into a text file.
18. Open PowerShell ISE to a new script.
19. Copy all of the text file data.
20. Paste the code into PowerShell ISE.
21. Find and replace unnecessary spaces and tabs.
22. Replace any data that has been copied incorrectly with the correct code.
23. Continue to remove middle names where missing.
24. Shift data to the right and in column A add the `dsadd user -upn` prefix.
25. Copy and paste the 10 rows down to the last row of the dataset.
26. Between rows E and G create a new row and paste in `-fn`.
27. Copy and paste this down to the end of the dataset.
28. Save the file to the desktop of the server.
29. Back on the server, open CMD and run the script.
30. Check ADUC to see if the users were added.
31. Run `(Get-ADUser -Filter *).count` to verify the number of users created — should be **2,097**.

## Part 5: Verify Access from the Workstation

32. Sign out from the server.
33. Make sure the Workstation signs out.
34. Open ADUC and select all users under `accounting`.
35. Sign into one of the users on the Workstation.
36. Continue doing the same for each department to verify access works.
37. The user logged in successfully and a home folder was created for that user.
