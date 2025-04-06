# Download the batch tool to a temp location
$toolUrl = "https://raw.githubusercontent.com/GigaVolt3/multitool/main/new.bat"
$tempPath = "$env:TEMP\multitool.bat"

Invoke-WebRequest -UseBasicParsing -Uri $toolUrl -OutFile $tempPath

# Open it in a new Command Prompt window
Start-Process cmd -ArgumentList "/k `"$tempPath`""
