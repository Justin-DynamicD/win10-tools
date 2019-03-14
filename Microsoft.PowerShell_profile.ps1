function prompt {
  $host.ui.rawui.WindowTitle = $(get-location) 
  $prompt_string = ""

  if(Test-Path .git) {
    $prompt_string = "PS " + (pwd).Path + " (GIT"
    git branch | foreach {
      if ($_ -match "^\*(.*)"){
        $prompt_string += $matches[1] + ")> "
      }
    }
  }
  else{
    $prompt_string = "PS " + (pwd).Path + "> "
  }   
  Write-Host ($prompt_string) -nonewline -foregroundcolor yellow
  return " "
}