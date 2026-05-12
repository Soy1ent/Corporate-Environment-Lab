# Lab Walkthrough: Windows Server Virtualization

> **Full PDF with screenshots:** [Windows_Server_Virtualization.pdf](../lab-docs/Windows_Server_Virtualization.pdf)
> **Section page:** [Windows Server Virtualization](../docs/01-virtualization.md)

---

## Goal

Install VMware Workstation Pro, create Windows Server 2025 and Windows 11 virtual machines, install both operating systems, and rename the machines for the Across the States Bank environment.

---

## Steps

1. Login to Azure DevTools, navigate to the software section to download Windows Server and Windows 11.
2. Open VMware Workstation and select the "Typical (recommended)" configuration to initiate the New Virtual Machine Wizard.
3. Configure the virtual memory to 4GB (4096 MB) and ensure the ISO image is correctly mapped to the virtual disc drive.
4. Start the virtual machine and prompt the system to boot from the virtual CD/DVD environment.
5. Access the Boot Manager and select the EFI VMware Virtual SATA CDROM Drive to begin the setup process.
6. Enter the unique product key obtained from the Azure software portal into the Windows Setup field.
7. Review the Microsoft Software License Terms and select the checkbox to accept and proceed.
8. Allow the virtual machine to restart; the Windows logo indicates the operating system is initializing.
9. Monitor the blue installation status screen and ensure the VM remains powered on until the process reaches 100%.
10. Sign in with your Grand Canyon University student credentials to authenticate the server environment.
11. Verify the device summary for the server VM, ensuring it is named appropriately for your corporation.
12. Power on the server virtual machine and wait for the initial Windows Server boot sequence to load.
13. Select the "Use a product key" option and input the Server 2025 key provided in your resources.
14. Oversee the automated installation of Windows Server components until the system prompts for a restart.
15. Log in to the administrator account using the complex password created during the configuration phase.
16. Confirm that both the Windows 11 client and the Windows Server 2025 environment are running concurrently.
17. Utilize the search function to locate "sysdm.cpl" to manage system properties and identification.
18. Update the computer name to your specific corporate identifier and restart the system to finalize the deployment.
