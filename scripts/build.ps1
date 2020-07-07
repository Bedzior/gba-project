param(
    [Parameter(Mandatory, Position=0)]
        [ValidateSet('Release', 'Debug')]
        [String]
        $BuildConfig
)

$ErrorActionPreference = "Stop"

If (Test-Path ".\variables.ps1")
{
    . .\variables.ps1
}
ElseIf (Test-Path ".\scripts\variables.ps1") {
    . .\scripts\variables.ps1
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

cmake `
    --build $BUILD `
    --config $BuildConfig `
    --target game.gba `
    --parallel 4 `


Exit $LASTEXITCODE
