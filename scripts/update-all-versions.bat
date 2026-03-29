@echo off
setlocal enabledelayedexpansion

:: Simple script to update version for all packages in the workspace
:: Usage: scripts\update-all-versions.bat <version>

set "VERSION=%~1"

if "%VERSION%"=="" (
    echo Error: Version argument is required
    echo Usage: scripts\update-all-versions.bat ^<version^>
    exit /b 1
)

echo Updating all packages to version %VERSION%...

:: Update root package.json
echo Updating root package.json...
node -e "const fs=require('fs');const p=process.argv[1];const v=process.argv[2];const pkg=JSON.parse(fs.readFileSync(p,'utf8'));pkg.version=v;fs.writeFileSync(p,JSON.stringify(pkg,null,2)+'\n');console.log(pkg.name+' updated to version '+v);" package.json "%VERSION%"

:: Update workspace packages
echo Updating workspace packages...
for /d %%p in (packages\*) do (
    if exist "%%p\package.json" (
        echo Updating %%p\package.json...
        node -e "const fs=require('fs');const p=process.argv[1];const v=process.argv[2];const pkg=JSON.parse(fs.readFileSync(p,'utf8'));pkg.version=v;fs.writeFileSync(p,JSON.stringify(pkg,null,2)+'\n');console.log(pkg.name+' updated to version '+v);" "%%p\package.json" "%VERSION%"
    )
)

:: Update integration-test
if exist "integration-test\package.json" (
    echo Updating integration-test\package.json...
    node -e "const fs=require('fs');const p=process.argv[1];const v=process.argv[2];const pkg=JSON.parse(fs.readFileSync(p,'utf8'));pkg.version=v;fs.writeFileSync(p,JSON.stringify(pkg,null,2)+'\n');console.log(pkg.name+' updated to version '+v);" integration-test\package.json "%VERSION%"
)

echo All packages updated to version %VERSION%!

endlocal
