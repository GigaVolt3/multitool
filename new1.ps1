# --- Fancy Loading Bar ---
$loadingTime = 5       # Total seconds
$steps = 20            # How many bars to show
$interval = $loadingTime / $steps

Write-Host "`n[INFO] Initializing MultiTool..." -ForegroundColor Cyan
for ($i = 1; $i -le $steps; $i++) {
    $percent = [math]::Round(($i / $steps) * 100)
    $bar = ('█' * $i).PadRight($steps, '░')
    Write-Host -NoNewline "`r[$bar] $percent%" 
    Start-Sleep -Milliseconds ($interval * 1000)
}
Write-Host "`n[INFO] Loading Complete!`n" -ForegroundColor Green

# --- Fetch the Batch Script from GitHub ---
$toolUrl = "https://raw.githubusercontent.com/GigaVolt3/multitool/main/new.bat"
$tempPath = "$env:TEMP\multitool.bat"

Invoke-WebRequest -UseBasicParsing -Uri $toolUrl -OutFile $tempPath

# --- Launch in Separate CMD Window ---
Start-Process cmd -ArgumentList "/k `"$tempPath`""
