Const RATAIL_GROUP = "cn=Retail"
Const SALES_GROUP = "cn=Sales"
Const CUSTOMER_SERVICE_GROUP = "cn=CustomerService"
Const MARKETING_GROUP    	= "cn=Marketing"
Const ACCOUNTING_GROUP     	= "cn=Accounting"
Const HUMAN_RESOURCES_GROUP = "cn=HumanResources"
Const MANAGER_GROUP = "cn=Manager"


Set wshNetwork = CreateObject("WScript.Network")

'wshNetwork.AddWindowsPrinterConnection
'"\\scWinServer01\Printer\HrLaser"

'wshNetwork.MapNetworkDrive "o:", "\\scWinServer01\Home\" & wshNetwork.UserName
wshNetwork.MapNetworkDrive "q:", "\\scWinServer01\General"

Set ADSysInfo = CreateObject("ADSystemInfo")
Set CurrentUser = GetObject("LDAP://" & ADSysInfo.UserName)
'strGroups = LCase(Join(CurrentUser.MemberOf))


If IsMember(wshNetwork.UserName,MANAGER_GROUP) Then
    	wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share"
    	'wshNetwork.AddWindowsPrinterConnection
    	'"\\scWinServer01\Printer\HrLaser"
    	'wshNetWork.SetDefaultPrinter   
	'"\\scWinServer01\Printer\HrLaser"

ElseIf IsMember(wshNetwork.UserName, RATAIL_GROUP) Then

    	wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share\Retail"

ElseIf IsMember(wshNetwork.UserName, SALES_GROUP) Then

    	wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share\Sales"

ElseIf IsMember(wshNetwork.UserName, CUSTOMER_SERVICE_GROUP) Then

    	wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share\CustomerService"
	
ElseIf IsMember(wshNetwork.UserName, MARKETING_GROUP) Then

    	wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share\Marketing"
    	'wshNetwork.AddWindowsPrinterConnection
    	'"\\scWinServer01\Printer\HrLaser"
    	'wshNetWork.SetDefaultPrinter   
	'"\\scWinServer01\Printer\HrLaser"

ElseIf IsMember(wshNetwork.UserName, ACCOUNTING_GROUP) Then
	MsgBox("Woot woot")
    	wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share\Accounting"

ElseIf IsMember(wshNetwork.UserName, HUMAN_RESOURCES_GROUP) Then

    	wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share\HumanResources"

Else

    wshNetwork.MapNetworkDrive "p:", "\\scWinServer01\Share"
			
End If

'The best function I ever found online
Function IsMember(objUser,GroupName)
Dim GroupDN
Dim arrTemp
Dim GroupCN
IsMember = False

'The MemberOf property is unusual in that it doesn't report or count a user as
'being a member of the Domain Users group.
'Also, if the user is a member of more than one additional group, the property is
'returned as an array, but if the user is a member of only one additional group,
'the property is NOT returned as a single-entry array, but as a single-valued property.
'This being the case, the first step is to take the return value and
'check to see if it is an array.
If IsArray(objUser.MemberOf) Then

'Loop through each group

For Each GroupDN in objUser.MemberOf

'Check to see if the specified groupname matches. The MemberOf property
'returns the DistinguishedName of the groups. Split on the comma to get
'just the group canonical name

arrTemp = split(GroupDN,",")
GroupCN = arrTemp(0)

If ucase(GroupCN) = "CN=" & ucase(GroupName) Then
IsMember = True
End If
Next

'Assume that the user is a member of only one group (or no groups).
'Follow the same steps as above

Else
arrTemp = split(objUser.MemberOf,",")
GroupCN = arrTemp(0)

If ucase(GroupCN) = "CN=" & ucase(GroupName) Then
IsMember = True
End If
End If

If Err.Number <> 0 Then IsMember = False
Err.Clear

End Function
