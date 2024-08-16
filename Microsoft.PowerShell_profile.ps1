# Set-Alias -Name c -Value "code"

New-Alias which where.exe

function zx {
    exit
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Invoke-Expression (&starship init powershell)
function Invoke-Starship-TransientFunction {
  &starship module character
}

# Invoke-Expression (&starship init powershell)

Enable-TransientPrompt

Set-PSReadlineOption -EditMode vi
# -------------------------------------------

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# Set-PsFzfOption -TabExpansion
Invoke-FuzzyGitStatus

Set-Alias -Name vim -Value "nvim"
Set-Alias -Name cat -Value "bat"

function Get-GitStatus { & git status }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope

function Get-GitCommit { & git commit -ev $args }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

function Get-GitAdd { & git add --all $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-GitTree { & git log --graph --oneline --decorate $args }
New-Alias -Name gt -Value Get-GitTree -Force -Option AllScope

$env:Path += ";$env:USERPROFILE\.cargo\bin"

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
