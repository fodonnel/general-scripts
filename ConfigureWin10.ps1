
function Run-Script() {
    Remove-WinApps
    Install-ChocoPackages
}

function Install-ChocoPackages() {
    $packages = @(
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

Run-Script