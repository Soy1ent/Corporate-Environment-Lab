# Lab Walkthrough: Group Policies

> **Full PDF with screenshots:** [Group_Policy.pdf](../lab-docs/Group_Policy.pdf)
> **Section page:** [Group Policies](../docs/06-group-policies.md)

---

## Goal

Create and configure 10 Group Policy Objects in the `as.bank` domain — covering password rules, screen locks, legal banners, drive mapping, folder redirection, software deployment, and desktop restrictions — and apply them to the workstation.

---

## GPO 1: Password Policy

1. Open **Group Policy Management** (`gpmc.msc`).
2. Right-click the domain and create a new GPO. Name it **Password Policy**.
3. Click **Edit** and under Computer Configuration go to **Windows Settings → Security Settings**.
4. Under Security Settings go to **Account → Password Policy** and configure the password complexity, length, and lockout settings.

## GPO 2: Lock Screen After 10 Minutes

5. Right-click on the domain and create a new GPO named **Lock Screen After 10 Minutes of Inactivity**.
6. Click **Edit** on the policy.
7. Under Computer Configuration go to **Policies → Windows Settings → Security Settings** and configure the screen saver timeout.

## GPO 3: Interactive Logon Banner

8. Find the policy named **Interactive Logon Message Text** and paste your legal notice in the text prompt.

## GPO 4: Remove Last-Logged on User

9. Go back to Group Policy Management and under the main domain create a new policy named **Remove Last-Logged on User**.
10. Click **Edit** on the policy to open the editor.
11. Under **Computer Configuration** go to **Policies → Windows Settings**.

## GPO 5: Disable CMD

12. Create a new GPO named **Disable the CMD**.
13. Click **Edit** and go under **User Configuration**.
14. Click enable and you should see the setting change on the Editor window.
15. To restore admin access: select the Disable the CMD policy and under **Scope** set Domain Admin permissions as shown.
16. Open a PowerShell window as Administrator and run `gpupdate /force`.
17. Restart the machine and confirm admin CMD access is back.

## GPO 6: Desktop Background

18. Move an image you wish to be the background into the shared folder.
19. Reopen Group Policy Management and create a GPO under the domain. Name the GPO **Desktop Background**.
20. Click **Edit** and under **User Configuration** go to **Administrative Template Settings → Desktop → Desktop Wallpaper**.
21. Click **Enable** and copy the UNC path to the image file, then click **Apply**.

## GPO 7: Drive Mapping

22. Go back to Group Policy Management and create a new policy.
23. Edit the policy and under **User Configuration** go to **Preferences → Windows Settings → Drive Maps**.
24. Fill out the window with the respective drive names for each department: accounting, hr, it, management, sales, security, consumer, commercial, bankofficers, executives.

## GPO 8: Folder Redirection

25. Edit the policy and under **User Configuration** go to **Policies → Windows Settings → File Redirection** and double-click **Desktop**.
26. Fill out the Desktop Properties to match the network share path.
27. Do the same for the **Documents** folder.

## GPO 9: Chrome Install (Software Deployment)

28. Open an internet browser and find a redistributable installer for Google Chrome.
29. Paste the `chrome.msi` installer onto the desktop of the server, then move it to the folder `installs`.
30. Under **permissions** for the folder `installs`, allow full control for Everyone.
31. Under the **share permissions**, add Users and set their permissions to Read & Execute.
32. Open Group Policy Management.
33. Right-click on the domain and create a new GPO named **Chrome Install**.
34. Right-click on the new policy and hit **Edit**.
35. Navigate to the Group Policy Management Editor.
36. Under **Computer Configuration → Policies → Software Settings → Software Install**, select the `chrome.msi` file.
37. Make sure to select **Assigned** install when the dialogue box sets up.
38. When done correctly, you will see Google Chrome listed with the correct location and Deployment set to Assigned.

## GPO 10: Search Bar

39. Right-click on the domain and create a new GPO named **Search Bar**.
40. Edit the new policy and under **User Configuration** go to **Preferences**.

## Applying the Policies

41. On the workstation, run `gpupdate /force` and restart the machine to see the policies take effect.
42. You will also see that the Desktop and Documents folders are redirected to the appropriate place.
43. If you sign in as a regular user you will see the respective drive mapped.
44. The wallpaper might take a second to switch to the new one.
45. The computer will install Google Chrome and Zoom automatically.
