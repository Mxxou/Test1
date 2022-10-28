# Hide PowerShell Console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

#IMPORTANT A METTRE AU DEBUT DE CHAQUE SCRIPT
New-Item -Path C:\Windows\Version.txt -ItemType File
Clear-Content C:\Windows\Version.txt
Add-Content C:\Windows\Version.txt "V1.0"




Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(400,405)
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "V1.0"
$Button1.width                   = 265
$Button1.height                  = 250
$Button1.location                = New-Object System.Drawing.Point(58,58)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',35)

$Form.controls.AddRange(@($Button1;$text))

[void]$Form.ShowDialog()
