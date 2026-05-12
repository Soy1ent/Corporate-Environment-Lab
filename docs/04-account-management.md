# Account Management

> **Lab walkthrough:** [Step-by-step instructions](../appendices/04-lab-account-management.md) · [Full PDF with screenshots](../lab-docs/Account_Management.pdf)
> **Related scripts:** [`foldersOUsUsergroups.ps1`](../scripts/foldersOUsUsergroups.ps1) · [`usercreation.ps1`](../scripts/usercreation.ps1)

---

## Share Permissions vs. NTFS Permissions

When a Windows system shares a folder over a network, two separate permission layers work together to determine what a user can actually do with the files inside.

- **Share permissions** control access at the network level, governing who can connect to a shared resource and with what level of rights.
- **NTFS permissions** operate at the file system level and apply regardless of whether a user is accessing the resource locally or remotely.

Understanding how these two layers interact is a foundational concept in Windows network administration.

## The Two Permission Layers

Share permissions offer three levels of access: **Read**, **Change**, and **Full Control**. These permissions are relatively straightforward and apply only to users connecting over a network.

NTFS permissions are considerably more granular, offering options such as **Read**, **Read and Execute**, **Write**, **Modify**, **List Folder Contents**, and **Full Control**, along with a set of advanced special permissions that allow administrators to fine-tune access at a detailed level.

Because both permission sets exist simultaneously on NTFS volumes, Windows must reconcile them whenever a user accesses a shared folder remotely.

## How Windows Picks Which One Wins

The governing principle is that Windows applies the **most restrictive** of the two permission sets when both are in play. If a user connects over the network, both share and NTFS permissions are evaluated, and whichever is more restrictive determines the user's effective access level.

As Dell Technologies (n.d.) explains, when a file is accessed through a share, "the most restrictive permission applies" — meaning a user with Read share permissions and Modify NTFS permissions will only receive Read access remotely, while retaining Modify access when working locally. Administrators who fail to account for this behavior often find that users are either locked out unexpectedly or granted more access than intended.

## The Best-Practice Approach

A common best practice is to set share permissions broadly, granting **Authenticated Users Full Control** at the share level, and then rely on the more granular NTFS permissions to enforce specific security controls. This simplifies the administrative model while keeping access tightly managed at the file system level.

Because local access bypasses share permissions entirely and is regulated solely by NTFS, those settings carry the most weight in any well-configured environment. Together, the two permission systems form a layered security model that gives administrators reliable, precise control over sensitive organizational data.

---

## What This Looked Like in the Lab

For this section I wrote a PowerShell script that built the entire departmental infrastructure in one pass:

- 10 department share folders (`accounting`, `hr`, `it`, `management`, `executives`, `sales`, `consumer`, `commercial`, `bankofficers`, `security`)
- An OU in Active Directory for each department
- A matching Global Security Group inside each OU
- A `home` and `profiles` share for roaming profile support

Then I used a second script (`usercreation.ps1`) to bulk-create **2,097 user accounts** across all 10 departments using `dsadd`. Every account was placed into the correct OU, made a member of the correct security group, and forced to change its password at first login.

The share permissions were set wide open at the share level (`Everyone - Full Control`), and the actual access control was enforced through NTFS — exactly the model described above.

---

## References

- Dell Technologies. (n.d.). Understanding file and folder permissions in Windows. Dell Support Knowledge Base. https://www.dell.com/support/kbdoc/en-us/000137238/understanding-file-and-folder-permissions-in-windows
