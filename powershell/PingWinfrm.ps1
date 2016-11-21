[void][system.reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
<#
.SYNOPSIS
Powershell winform for pinging things.

.DESCRIPTION
Works using the test-connection command however the delay in test-connection isn't being used. Instead
We have opted for an artificial delay in the loop using sleep to avoid flood issues.

Contribution to fixing my loop by Bryan Hughs. 

.NOTES
Bradley Gillap

#>



# Just some default variables if I ever decide to add the remaining controls

$bytes = "32"
$TTL = "80"
$pingNumber = 4

 #ping the localhost
function pingHost()
{



    $prop = @{N=’IPV4’; E={$_.IPV4Address}},
            @{N=’IPV6’; E={$_.IPV6Address}},
            @{N=’Latency’; E={$_.ResponseTime}},
            @{N=’Bytes’; E={$_.BufferSize}},
            @{N=’TTL’; E={$_.TimeToLive}}


    #changed from forech loop to a for loop
    for($num = 1; $num -le $pingNumber; $num++){
    #runs test-connection once then displays results
    $result = Test-Connection -ComputerName $txtHost.Text -BufferSize $txtbytes.Text -TimeToLive $txtTTL.Text -Count 1 -Verbose| format-list -property $prop | Out-String
    start-sleep -Seconds 1
    $rtxt.Appendtext($result)
    }

}


function clearForm()
{
    $rtxt.clear()
}



function exitForm() {

	$formWmi.Close()

}


#Draw Window
$formWmi = New-Object System.Windows.Forms.Form
$formWmi.Text = "Network Ping Demo"
$formWmi.StartPosition = "CenterScreen"
$formWmi.ClientSize = "600,400"
$formWmi.MinimizeBox = $true
$formWmi.MaximizeBox = $false
$formWmi.BackColor = ""

#Host Label
$lblHost = New-Object System.Windows.Forms.Label
$lblHost.Location = New-Object System.Drawing.Size(10, 10)
$lblHost.Size = New-Object System.Drawing.Size(110,20)
$lblHost.Font = "Verdanna, 12"
$lblHost.Text = "Host Address:"
$formWmi.Controls.Add($lblHost)

#Host Textbox
$txtHost = New-Object System.Windows.Forms.TextBox
$txtHost.Name = "text1"
$txtHost.Location = New-Object System.Drawing.Size(120, 10)
$txtHost.Size = New-Object System.Drawing.Size(300,20)
$txtHost.Font = "Verdanna, 12"
$txtHost.Text = "localhost"
$formWmi.Controls.Add($txtHost)

#Ping Button
$btnPing = New-Object System.Windows.Forms.Button
$btnPing.Location = New-Object System.Drawing.Size(450,10)
$btnPing.Size = New-Object System.Drawing.Size(140,28)
$btnPing.Font = "Verdanna, 12"
$btnPing.Text = "Ping"
$btnPing.Add_Click({pingHost})
$formWmi.Controls.Add($btnPing)

#Clear Button
$btnClear = New-Object System.Windows.Forms.Button
$btnClear.Location = New-Object System.Drawing.Size(450,50)
$btnClear.Size = New-Object System.Drawing.Size(140,28)
$btnClear.Font = "Verdanna, 12"
$btnClear.Text = "Clear"
$btnClear.Add_Click({clearForm})
$formWmi.Controls.Add($btnClear)

#Clear Button
$btnExit = New-Object System.Windows.Forms.Button
$btnExit.Location = New-Object System.Drawing.Size(450,100)
$btnExit.Size = New-Object System.Drawing.Size(140,28)
$btnExit.Font = "Verdanna, 12"
$btnExit.Text = "Close"
$btnExit.Add_Click({exitForm})
$formWmi.Controls.Add($btnExit)


#TTL Label
$lblTTL = New-Object System.Windows.Forms.Label
$lblTTL.Location = New-Object System.Drawing.Size(420, 160)
$lblTTL.Size = New-Object System.Drawing.Size(110,50)
$lblTTL.Font = "Verdanna, 12"
$lblTTL.Text = "Time To Live:"
$formWmi.Controls.Add($lblTTL)

#TTL Input
$txtTTL = New-Object System.Windows.Forms.TextBox
$txtTTL.Name = "text2"
$txtTTL.Location = New-Object System.Drawing.Size(530, 160)
$txtTTL.Size = New-Object System.Drawing.Size(50,50)
$txtTTL.Font = "Verdanna, 12"
$txtTTL.Text = "$TTL"
$formWmi.Controls.Add($txtTTL)

#Bytes Label
$lblBytes = New-Object System.Windows.Forms.Label
$lblBytes.Location = New-Object System.Drawing.Size(420, 210)
$lblBytes.Size = New-Object System.Drawing.Size(110,50)
$lblBytes.Font = "Verdanna, 12"
$lblBytes.Text = "Bytes:"
$formWmi.Controls.Add($lblBytes)

#Bytes Input
$txtBytes = New-Object System.Windows.Forms.TextBox
$txtBytes.Name = "text2"
$txtBytes.Location = New-Object System.Drawing.Size(530, 210)
$txtBytes.Size = New-Object System.Drawing.Size(50,50)
$txtBytes.Font = "Verdanna, 12"
$txtBytes.Text = "$bytes"
$formWmi.Controls.Add($txtBytes)

#rtxt Rich textbox
$rTxt = New-Object System.Windows.Forms.RichTextBox
$rTxt.Location = New-Object System.Drawing.Size(10,50)
$rTxt.Size = New-Object System.Drawing.Size(410,340)
$rTxt.BorderStyle = "FixedSingle"
$rTxt.BackColor = "white"
$formWmi.Controls.Add($rTxt)

#Link Label 1
$linkLabel1 = New-Object System.Windows.Forms.LinkLabel
$linkLabel1.Location = New-Object System.Drawing.Size(520,380)
$linkLabel1.Size = New-Object System.Drawing.Size(150,20)
$linkLabel1.LinkColor = "BLUE"
$linkLabel1.ActiveLinkColor = "RED"
$linkLabel1.Text = "Script Depot"
$linkLabel1.add_Click({[system.Diagnostics.Process]::start("https://github.com/hackmods/Script-Depot/tree/master/powershell")})
$formWmi.Controls.Add($LinkLabel1) 


#Draw Dialogue
$formWmi.ShowDialog()
