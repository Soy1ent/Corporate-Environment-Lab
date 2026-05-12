# Scripts

PowerShell scripts I wrote and used in the ASB lab environment.

---

## `foldersOUsUsergroups.ps1`

Builds the entire departmental infrastructure for the `as.bank` domain in one run:

1. Creates `C:\shares\` and 10 departmental subfolders
2. Publishes each folder as an SMB share with `Everyone - Full Control` at the share level
3. Creates `home` and `profiles` shares for roaming profile support
4. Creates one OU per department at the root of `as.bank`
5. Creates one Global Security Group inside each OU

Share-level permissions are intentionally permissive. All actual access control is enforced through NTFS permissions assigned to the security groups this script creates. See [`/docs/04-account-management.md`](../docs/04-account-management.md) for the permission model.

**Departments:** executives, hr, it, management, accounting, bankofficers, sales, consumer, commercial, security

**Usage:** Run from an elevated PowerShell session on the Domain Controller after domain promotion.

```powershell
.\foldersOUsUsergroups.ps1
```

---

## `usercreation.ps1`

Bulk-creates **2,097** Active Directory user accounts across all 10 departmental OUs using the `dsadd user` command-line tool.

Each account is created with:
- A UPN in `Firstname.MI.Lastname@as.bank` format
- Placement in the correct departmental OU
- Automatic group membership in the matching security group
- A temporary password (`Redvine2`) with `mustchpwd yes` — users must change on first login
- `disabled no` — accounts are active immediately

Some entries in the source data had missing middle initials (recorded as `..` in the UPN). These were left as-is to reflect the actual lab run.

**Usage:** Run from CMD or PowerShell as Domain Admin on the DC:

```cmd
.\usercreation.ps1
```

---

## Prerequisites (both scripts)

- Must be run as Domain Admin on `asS1`
- Domain `as.bank` must already be promoted
- `dsadd` is available natively on Windows Server
