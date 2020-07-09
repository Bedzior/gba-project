param(
    [Parameter(Mandatory, Position=0)]
        [ValidateSet('Release', 'Debug')]
        [String]
        $BuildConfig
)

$ErrorActionPreference = "Stop"

If (Test-Path ".\scripts\variables.ps1") {
    . .\scripts\variables.ps1
} Else {
    Write-Error "Script is not run from root directory" `
        -Category InvalidOperation `
        -RecommendedAction "Run the script from project's root directory" `
}

cmake `
    -G "Unix Makefiles" `
    -B $BUILD `
    -S $ROOT `
    -DCMAKE_BUILD_CONFIG=$BuildConfig `
    -DCMAKE_INSTALL_PREFIX=$INSTALL
If ($LASTEXITCODE -ne 0)
{
    Exit $LASTEXITCODE
}

$PROC_COUNT = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors

cmake `
    --build $BUILD `
    --config $BuildConfig `
    --target game.gba `
    --parallel $PROC_COUNT `


Exit $LASTEXITCODE
