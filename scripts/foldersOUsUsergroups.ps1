#this is an example from an instructor's company ITGITS
#change directory to the root
cd\
#Create Shares folder and change directory to it.
md shares
cd shares

#Create 10 departments.  Change the names to match what's appropriate for your company
md executives
new-smbshare -name "executives" -path c:\shares\executives -fullaccess "everyone"

md hr
new-smbshare -name "hr" -path c:\shares\hr -fullaccess "everyone"

md it
new-smbshare -name "it" -path c:\shares\it -fullaccess "everyone"

md management
new-smbshare -name "management" -path c:\shares\management -fullaccess "everyone"

md accounting
new-smbshare -name "accounting" -path c:\shares\accounting -fullaccess "everyone"

md bankofficers
new-smbshare -name "bankofficers" -path c:\shares\bankofficers -fullaccess "everyone"

md sales
new-smbshare -name "sales" -path c:\shares\sales -fullaccess "everyone"

md consumer
new-smbshare -name "consumer" -path c:\shares\consumer -fullaccess "everyone"

md commercial
new-smbshare -name "commercials" -path c:\shares\commercial -fullaccess "everyone"

md security
new-smbshare -name "security" -path c:\shares\security -fullaccess "everyone"

#Create Home and Profiles folders for later use
md home
new-smbshare -name "home" -path c:\shares\home -fullaccess "everyone"

md profiles
new-smbshare -name "profiles$" -path c:\shares\profiles -fullaccess "everyone"

#create OUs  Be sure to change the Name to what's appropriate for your company 
#also change the path to be your domain.  
#Example: 
#New-ADOrganizationalUnit -Name "OUNAME" -Path "DC=FIRSTPARTOFYOURDOMAIN,DC=LASTPARTOFYOURDOMAIN"
New-ADOrganizationalUnit -Name "executives" -Path "DC=as,DC=bank"
new-adorganizationalunit -Name "hr" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "it" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "management" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "accounting" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "consumer" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "commercial" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "security" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "bankofficers" -Path "DC=as,DC=bank"
New-ADOrganizationalUnit -Name "sales" -Path "DC=as,DC=bank"

#create user group.  The name must match the OUs and Folders created above.  Same for the Path.
#Example: 
#New-ADGroup -Name "GROUPNAME" -SamAccountName GROUPNAME -GroupCategory Security -GroupScope Global  -Path "OU=FIRSTPARTOFYOURCOMAIN,DC=itgits,DC=LASTPARTOFYOURDOMAIN"
New-ADGroup -Name "executives" -SamAccountName executives -GroupCategory Security -GroupScope Global  -Path "OU=executives,DC=as,DC=bank" 
New-ADGroup -Name "hr" -SamAccountName hr -GroupCategory Security -GroupScope Global  -Path "OU=hr,DC=as,DC=bank"
New-ADGroup -Name "it" -SamAccountName it -GroupCategory Security -GroupScope Global  -Path "OU=it,DC=as,DC=bank" 
New-ADGroup -Name "management" -SamAccountName management -GroupCategory Security -GroupScope Global  -Path "OU=management,DC=as,DC=bank"
New-ADGroup -Name "accounting" -SamAccountName accounting -GroupCategory Security -GroupScope Global  -Path "OU=accounting,DC=as,DC=bank" 
New-ADGroup -Name "consumer" -SamAccountName consumer -GroupCategory Security -GroupScope Global  -Path "OU=consumer,DC=as,DC=bank"
New-ADGroup -Name "sales" -SamAccountName sales -GroupCategory Security -GroupScope Global  -Path "OU=sales,DC=as,DC=bank" 
New-ADGroup -Name "commercial" -SamAccountName commercial -GroupCategory Security -GroupScope Global  -Path "OU=commercial,DC=as,DC=bank" 
New-ADGroup -Name "bankofficers" -SamAccountName bankofficers -GroupCategory Security -GroupScope Global  -Path "OU=bankofficers,DC=as,DC=bank" 
New-ADGroup -Name "security" -SamAccountName security -GroupCategory Security -GroupScope Global  -Path "OU=security,DC=as,DC=bank"

 

 

  