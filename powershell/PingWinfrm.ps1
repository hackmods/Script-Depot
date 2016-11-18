
[void][system.reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

# Just some default variables if I ever decide to add the remaining controls
$bytes = "32"
$TTL = "80"
$pingNumber = "4"

 #ping the localhost
function pingHost()
{



    $prop = @{N=’IPV4’; E={$_.IPV4Address}},
            @{N=’IPV6’; E={$_.IPV6Address}},
            @{N=’Latency’; E={$_.ResponseTime}}
    $result = Test-Connection -ComputerName $txtHost.Text -BufferSize $bytes -TimeToLive $TTL -Count $pingNumber -Verbose| format-list -property $prop | Out-String


    $rtxt.Appendtext($result)


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

#rtxt Rich textbox
$rTxt = New-Object System.Windows.Forms.RichTextBox
$rTxt.Location = New-Object System.Drawing.Size(10,50)
$rTxt.Size = New-Object System.Drawing.Size(410,340)
$rTxt.BorderStyle = "FixedSingle"
$rTxt.BackColor = "white"
$formWmi.Controls.Add($rTxt)



#Draw Dialogue
$formWmi.ShowDialog() 
