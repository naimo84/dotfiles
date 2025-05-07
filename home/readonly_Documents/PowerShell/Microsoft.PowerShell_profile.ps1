$ENV:STARSHIP_DISTRO = ''
$Env:HOME = $HOME
Invoke-Expression "$(direnv hook pwsh)"
Invoke-Expression (&starship init powershell)

function sudo {
    Start-Process @args -verb runas
}