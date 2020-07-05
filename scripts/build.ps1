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

$UNIX_ROOT = $ROOT -replace '\\','/'

mkdir -Force -Path $BUILD
Try {
    Push-Location $BUILD
    cmake `
        -G "Unix Makefiles" `
        -B $BUILD `
        -S $ROOT `
        -DCMAKE_BUILD_CONFIG=$BuildConfig `
        -DCMAKE_INSTALL_PREFIX=$INSTALL
} Finally {
    Pop-Location
}
If ($LASTEXITCODE -ne 0)
{
    Exit $LASTEXITCODE
}

make -j 4 `
    --directory $BUILD `

Exit $LASTEXITCODE
