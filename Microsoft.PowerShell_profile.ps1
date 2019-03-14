function prompt {
  $host.ui.rawui.WindowTitle = $(get-location)

  if(Test-Path .git) {
    $git_string = " (GIT"
    git branch | foreach {
      if ($_ -match "^\*(.*)"){
        $git_string += $matches[1] + ")"
      }
    }
  }
  
  $prompt_string = "PS " + (pwd).Path
  Write-Host ($prompt_string) -nonewline -foregroundcolor yellow
  if ($git_string) { Write-Host ($git_string) -NoNewline -ForegroundColor Green }
  Write-Host "> " -NoNewline -ForegroundColor Yellow
  return " "
}
