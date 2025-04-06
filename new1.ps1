# Download the batch tool to a temp location
$toolUrl = "https://raw.githubusercontent.com/GigaVolt3/multitool/main/new.bat"
$tempPath = "$env:TEMP\multitool.bat"

# Display a noticeable loading bar
$loadingTime = 5       # total seconds
$steps = 20            # number of progress blocks
$interval = $loadingTime / $steps

Write-Host "`n[INFO] Loading MultiTool..." -ForegroundColor Cyan
for ($i = 1; $i -le $steps; $i++) {
    $percent = [math]::Round(($i / $steps) * 100)
    $bar = ('█' * $i).PadRight($steps, '░')
    Write-Host -NoNewline "`r[$bar] $percent%" 
    Start-Sleep -Milliseconds ($interval * 1000)
}
Write-Host "`n[INFO] Launching..."

# Download the batch file
Invoke-WebRequest -UseBasicParsing -Uri $toolUrl -OutFile $tempPath

# Open it in a new Command Prompt window
Start-Process cmd -ArgumentList "/k `"$tempPath`""
