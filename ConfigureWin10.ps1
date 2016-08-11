
function Run-Script() {
    Remove-WinApps
    Install-ChocoPackages
    Set-ExplorerOptions
}


function Install-ChocoPackages() {
    $packages = @(
        "cmder",
        "visualstudiocode",
        "nodejs.install",
        "everything",
        "sysinternals"
    )

    & choco feature enable -n=allowGlobalConfirmation
    foreach ($package in $packages) {
        & choco install $package
    }
}


function Remove-WinApps() {
    $apps = @(
        "*people",
        "*bing*",
        "*windowsphone",
        "*office*",
        "*xbox*",
        "*solitaire*",
        "*3dbuilder*",
        "*getstarted*",
        "*maps*",
        "*photos*",
        "*zune*",
        "*communicationsapps*",
        "*commsphone*"
    )

    foreach ($app in $apps) {
        get-appxpackage $app | remove-appxpackage
    }
}


function Set-ExplorerOptions() {
    Push-Location
    Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    Set-ItemProperty . Hidden 1
    Set-ItemProperty . HideFileExt 0
    Set-ItemProperty . ShowSuperHidden 1
    Set-ItemProperty . DontPrettyPath 0
    Pop-Location
}

Run-Script