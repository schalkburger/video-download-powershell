# Set the default directory
Set-Location -Path "E:\Downloads"

# Get the URL from the clipboard
$url = Get-Clipboard


# Check if a valid URL is present
if ($url -match '^https?://.*') {

    # Assuming $url contains the URL from the clipboard
    # $formatArgument = '-f "mp4"'
    # Start-Process -FilePath "yt-dlp" -ArgumentList "$url $formatArgument" -Wait

    # Run yt-dlp with the URL
    Start-Process -FilePath "yt-dlp" -ArgumentList $url -Wait
    # Write-Host "Url is" $url

    # Provide options to the user
    do {
        Write-Host "Press 'O' to open the Downloads folder, 'X' to close this window"
        $key = [System.Console]::ReadKey().Key
        if ($key -eq 'O') {
            # Open the Downloads folder
            Invoke-Item "E:\Downloads"
            Write-Host "`nOpening Downloads folder..."
            break  # Exit the loop after opening the Downloads folder
        }
    } while ($key -ne 'X')

}
else {
    Write-Host "`nNo valid URL found in the clipboard."
}

# Wait for a keypress before closing the PowerShell window
Write-Host "Press any key to close this window"
[Console]::ReadKey() | Out-Null
