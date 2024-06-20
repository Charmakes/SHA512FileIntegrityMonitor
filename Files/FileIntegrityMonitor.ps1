# Prompt user to che# Prompt for the paths
$filesPath = Read-Host -Prompt "Enter the path to the directory containing your files"
$baselinePath = Read-Host -Prompt "Enter the path to the baseline file (e.g., baseline.txt)"

# Set a default baseline file path if none is provided
if ([string]::IsNullOrWhiteSpace($baselinePath)) {
    $baselinePath = "baseline.txt"
}

Function Remove-ExistingBaseline {
    if (Test-Path -Path $baselinePath) {
        # Remove the existing baseline file
        Remove-Item -Path $baselinePath
    }
}

Function Compute-FileHash($filepath) {
    return Get-FileHash -Path $filepath -Algorithm SHA512
}

Write-Host "`nPlease choose an action:`n"
Write-Host "    1) Generate a new baseline"
Write-Host "    2) Monitor files using the current baseline`n"
$response = Read-Host -Prompt "Enter '1' or '2'"

if ($response -eq "1") {
    # Remove the baseline file if it exists
    Remove-ExistingBaseline

    # Generate new baseline data by computing hashes for all files in the target directory
    Get-ChildItem -Path $filesPath | ForEach-Object {
        $hash = Compute-FileHash $_.FullName
        "$($_.FullName)|$($hash.Hash)" | Out-File -FilePath $baselinePath -Append
    }
    Write-Host "New baseline created at $baselinePath."
}
elseif ($response -eq "2") {
    if (-not (Test-Path -Path $baselinePath)) {
        Write-Host "Baseline file does not exist. Please generate a new baseline first by selecting option 1."
        exit
    }

    $baselineData = @{}

    # Read the baseline file and populate the hash dictionary
    Get-Content -Path $baselinePath | ForEach-Object {
        $splitData = $_.Split("|")
        $baselineData[$splitData[0]] = $splitData[1]
    }

    # Continuous file monitoring
    while ($true) {
        Start-Sleep -Seconds 1

        Get-ChildItem -Path $filesPath | ForEach-Object {
            $hash = Compute-FileHash $_.FullName

            if (-not $baselineData.ContainsKey($hash.Path)) {
                # New file detected
                Write-Host "$($hash.Path) has been created!" -ForegroundColor Green
            } elseif ($baselineData[$hash.Path] -ne $hash.Hash) {
                # File modification detected
                Write-Host "$($hash.Path) has changed!!!" -ForegroundColor Yellow
            }
        }

        foreach ($key in $baselineData.Keys) {
            if (-not (Test-Path -Path $key)) {
                # File deleted
                Write-Host "$key has been deleted!!!" -ForegroundColor Red
                $baselineData.Remove($key)
            }
        }
    }
}
else {
    Write-Host "Invalid selection. Please run the script again and enter '1' or '2'."
}
