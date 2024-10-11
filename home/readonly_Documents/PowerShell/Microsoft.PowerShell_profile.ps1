$ENV:STARSHIP_DISTRO = ''
Invoke-Expression (&starship init powershell)

function sudo {
    Start-Process @args -verb runas
}