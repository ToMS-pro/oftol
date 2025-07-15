Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form
$form.Text = "ToMsPro Toolkit GUI v1.0"
$form.Size = New-Object Drawing.Size(430,360)
$form.StartPosition = "CenterScreen"
$form.BackColor = 'Black'
$form.ForeColor = 'Lime'

$header = New-Object Windows.Forms.Label
$header.Text = "ToMsPro Toolkit v1.0 - Anti Kendor"
$header.Font = New-Object Drawing.Font("Consolas", 14, [Drawing.FontStyle]::Bold)
$header.AutoSize = $true
$header.Location = New-Object Drawing.Point(40, 20)
$form.Controls.Add($header)

$group = New-Object Windows.Forms.GroupBox
$group.Text = "Menu Utama"
$group.ForeColor = "Lime"
$group.BackColor = "Black"
$group.Location = New-Object Drawing.Point(30, 70)
$group.Size = New-Object Drawing.Size(360, 200)
$form.Controls.Add($group)

# Tombol: Cek Jaringan
$btnCek = New-Object Windows.Forms.Button
$btnCek.Text = "1. Cek Jaringan (Ping / Tracert)"
$btnCek.Size = New-Object Drawing.Size(300,30)
$btnCek.Location = New-Object Drawing.Point(25,30)
$btnCek.Add_Click({
    $pingForm = New-Object Windows.Forms.Form
    $pingForm.Text = "Cek Jaringan"
    $pingForm.Size = New-Object Drawing.Size(400,250)
    $pingForm.StartPosition = "CenterScreen"
    
    $lbl = New-Object Windows.Forms.Label
    $lbl.Text = "Masukkan alamat IP atau domain:"
    $lbl.Location = New-Object Drawing.Point(20,20)
    $lbl.AutoSize = $true
    $pingForm.Controls.Add($lbl)

    $txtTarget = New-Object Windows.Forms.TextBox
    $txtTarget.Size = New-Object Drawing.Size(250,20)
    $txtTarget.Location = New-Object Drawing.Point(20,50)
    $pingForm.Controls.Add($txtTarget)

    $btnPing = New-Object Windows.Forms.Button
    $btnPing.Text = "Ping"
    $btnPing.Location = New-Object Drawing.Point(20,90)
    $btnPing.Add_Click({ Start-Process "cmd.exe" "/c ping $($txtTarget.Text)" })
    $pingForm.Controls.Add($btnPing)

    $btnTracert = New-Object Windows.Forms.Button
    $btnTracert.Text = "Tracert"
    $btnTracert.Location = New-Object Drawing.Point(100,90)
    $btnTracert.Add_Click({ Start-Process "cmd.exe" "/c tracert $($txtTarget.Text)" })
    $pingForm.Controls.Add($btnTracert)

    $btnClose = New-Object Windows.Forms.Button
    $btnClose.Text = "Tutup"
    $btnClose.Location = New-Object Drawing.Point(180,90)
    $btnClose.Add_Click({ $pingForm.Close() })
    $pingForm.Controls.Add($btnClose)

    $pingForm.ShowDialog()
})
$group.Controls.Add($btnCek)

# Tombol: Anti Kendor
$btnKendor = New-Object Windows.Forms.Button
$btnKendor.Text = "2. Tools Anti Kendor (Flush DNS / Cache)"
$btnKendor.Size = New-Object Drawing.Size(300,30)
$btnKendor.Location = New-Object Drawing.Point(25,70)
$btnKendor.Add_Click({
    $choice = [System.Windows.Forms.MessageBox]::Show("Jalankan Flush DNS?", "ToMsPro", "YesNoCancel", "Question")
    if ($choice -eq "Yes") {
        Start-Process "cmd.exe" "/c netsh winsock reset && netsh int ip reset && netsh advfirewall reset && ipconfig /flushdns && ipconfig /release && ipconfig /renew"
    } elseif ($choice -eq "No") {
        Start-Process "cmd.exe" "/c cleanmgr.exe /sagerun:11"
    }
})
$group.Controls.Add($btnKendor)

# Tombol: Aktivasi Office
$btnAktivasi = New-Object Windows.Forms.Button
$btnAktivasi.Text = "3. Aktivasi Office"
$btnAktivasi.Size = New-Object Drawing.Size(300,30)
$btnAktivasi.Location = New-Object Drawing.Point(25,110)
$btnAktivasi.Add_Click({
    powershell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm https://get.activated.win | iex"
})
$group.Controls.Add($btnAktivasi)

# Tombol: Keluar
$btnExit = New-Object Windows.Forms.Button
$btnExit.Text = "4. Keluar"
$btnExit.Size = New-Object Drawing.Size(300,30)
$btnExit.Location = New-Object Drawing.Point(25,150)
$btnExit.BackColor = "DarkRed"
$btnExit.ForeColor = "White"
$btnExit.Add_Click({ $form.Close() })
$group.Controls.Add($btnExit)

[void]$form.ShowDialog()
