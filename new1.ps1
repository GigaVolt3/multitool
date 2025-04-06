# Download the batch tool to a temp location
$toolUrl = "https://raw.githubusercontent.com/GigaVolt3/multitool/main/new.bat"
$tempPath = "$env:TEMP\multitool.bat"

# Loading animation (5 seconds)
Write-Host "`n[INFO] Preparing to launch MultiTool..." -ForegroundColor Cyan
for ($i = 1; $i -le 20; $i++) {
    Write-Host -NoNewline "█"
    Start-Sleep -Milliseconds 250
}
Write-Host "`n[INFO] Starting..."

# Download the batch file
Invoke-WebRequest -UseBasicParsing -Uri $toolUrl -OutFile $tempPath

# Open it in a new Command Prompt window
Start-Process cmd -ArgumentList "/k `"$tempPath`""
