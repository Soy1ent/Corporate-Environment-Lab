# Lab Walkthrough: Backup and Restore

> **Full PDF with screenshots:** [Backup_and_Restore.pdf](../lab-docs/Backup_and_Restore.pdf)
> **Section page:** [Backup and Restore](../docs/10-backup-restore.md)

---

## Goal

Add a virtual disk to the server VM for backup storage, install Windows Server Backup, enable the AD Recycle Bin, perform a full backup, simulate data loss by deleting AD users, and restore the system state to bring everything back.

---

## Part 1: Add a Virtual Backup Disk

1. Open Virtual Machine Settings for the Server VM and add a **Hard Disk**.
2. Select **"NVMe"** as the virtual disk type and click Next.
3. Choose **"Create a new virtual disk"** and click Next.
4. Set the disk capacity to **25GB**.
5. Specify the disk file location and click Finish.
6. Start the server virtual machine.

## Part 2: Initialize the Disk

7. Open **Disk Management** from the Server Manager Tools menu.
8. In Disk Management, right-click the new unallocated disk.
9. Launch the **New Simple Volume Wizard**.
10. In the New Simple Volume Wizard, assign a drive letter to the new volume.

## Part 3: Install Windows Server Backup

11. Select **Add roles and features**.
12. In the **Select Features** screen, expand **"Windows Server Backup"** and check it, then click Next.
13. Open **Active Directory Administrative Center** from Server Manager.

## Part 4: Enable Recycle Bin and Simulate Deletion

14. Enable the **Recycle Bin**.
15. Open **Active Directory Users and Computers**, delete any number of users from `accounting`, and confirm the warning prompt to proceed.
16. In Active Directory Users and Computers, select the deleted users and then select **Restore** to recover them.

## Part 5: Perform a Full Backup

17. In **Windows Server Backup**, click **"Backup Once"** to open the Backup Once Wizard and begin the backup process.
18. Wait for the backup to complete. Verify the successful backup status shown in the **Last Backup** panel.

## Part 6: System State Restore

19. Restart the Virtual Machine in **Safe Mode**.
20. In Windows Server Backup, click **"Recover"** to open the Recovery Wizard.
21. In the Recovery Wizard, select the recovery type and choose **"System State"**.
22. In the Recovery Wizard, confirm the recovery settings on the Confirmation screen, then click **Recover**.
23. Monitor the **Recovery Progress** screen and wait for all items to show as completed.
24. After the restore, observe the system restarting and the System Configuration prompt appearing.
25. Restart the machine without Safe Boot and log in to see the OU and Users restored.
