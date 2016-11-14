#clear form textbox
function clearForm
{
    $txtComp.clear()
    $rTxt.clear()
}

function GetCPUInfo
{
    #get user value from textbox
    $computer = $txtComp.Text

    #run cmdlet get-wmiobject for CPU information
    $prop = "caption", "CPUStatus", "DeviceID", "name", "systemName"
    $result = Get-WmiObject -Class Win32_Processor -cn $computer | Select-Object $prop

    #output results into the rich text box
    $rTxt.AppendText("*******CPU INFO*******" + "`t`t ******Info*****" + "`r")
    $rTxt.AppendText("Computer Name:`t`t`t" + $computer + "`r")
    $rTxt.AppendText("Caption:`t`t`t" + $result.caption + "`r")
    $rTxt.AppendText("CPUStatus:`t`t`t" + $result.CPUStatus + "`r")
    $rTxt.AppendText("DeviceID:`t`t`t" + $result.DeviceID + "`r")
    $rTxt.AppendText("Name:`t`t`t" + $result.Name + "`r")
    $rTxt.AppendText("SystemName:`t`t`t" + $result.SystemName + "`r")

}


#Add GUI form library
[void][system.reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

#Form has to be in before objects as the parent.
#Form Window
$formWmiDemo = New-Object System.Windows.Forms.Form
$formWmiDemo.Text = "WMIObject Demo"
$formWmiDemo.StartPosition = "CenterScreen"
$formWmiDemo.ClientSize = "600, 400" #everything on XY axis
$formWmiDemo.MinimizeBox = $true
$formWmiDemo.MaximizeBox = $true
$formWmiDemo.BackColor = "black"
$formWmiDemo.ForeColor = "white"

#Computer Name Label
$lblComp = New-Object System.Windows.Forms.Label
$lblComp.Font = "Verdanna, 11"
$lblComp.Text = "Computer Name:"
$lblComp.Size = New-Object System.Drawing.Size(150, 40)
$lblComp.Location = New-Object System.Drawing.Size(10, 10)
$formWmiDemo.Controls.Add($lblComp)

#Computer Name Textbox
$txtComp = New-Object System.Windows.Forms.TextBox
$txtComp.size = New-Object System.Drawing.Size(300,40)
$txtComp.location = New-Object System.Drawing.Size(160,10)
$txtComp.Text = "localhost"
$formWmiDemo.Controls.Add($txtComp)

#Computer CPUINFO button
$btnCpu = New-Object System.Windows.Forms.Button
$btnCpu.size = New-Object System.Drawing.Size(90,30)
$btnCpu.Location = New-Object System.Drawing.Size(500,10)
$btnCpu.Text = "CPU Info"
$btnCpu.Add_Click({GetCPUInfo})
$formWmiDemo.Controls.Add($btnCpu)

#Rich textbox
$rTxt = New-Object System.Windows.Forms.RichTextBox
$rTxt.Location = New-Object System.Drawing.Size(10,50)
$rTxt.Size = New-Object System.Drawing.Size(450,300)
$formWmiDemo.Controls.Add($rTxt)

#Make clear button
$btnClear = New-Object System.Windows.Forms.Button
$btnClear.size = New-Object System.Drawing.Size(90,30)
$btnClear.Location = New-Object System.Drawing.Size(500,50)
$btnClear.Text = "Clear"
$btnClear.Add_Click({clearForm})  #Event is click and calls function clear form
$formWmiDemo.Controls.Add($btnClear)



$formWmiDemo.ShowDialog() 
