$moduleRootFilePath = Split-Path -Path $PSScriptRoot -Parent
$moduleRootFilePath
$moduleName = (Get-Item -Path $moduleRootFilePath).Name
$moduleManifestPath = Join-Path -Path $moduleRootFilePath -ChildPath "$moduleName.psd1"
$moduleManifestProperties = Test-ModuleManifest -Path $moduleManifestPath -ErrorAction 'SilentlyContinue'
$moduleManifestProperties.PowerShellVersion