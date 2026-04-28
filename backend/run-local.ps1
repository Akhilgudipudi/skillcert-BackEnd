$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Look for the bundled Maven
$mavenCmd = Join-Path $projectRoot "..\BACKEND-main\backend\maven\apache-maven-3.9.6\bin\mvn.cmd"

if (-not (Test-Path $mavenCmd)) {
    # Try current directory just in case
    $mavenCmd = Join-Path $projectRoot "maven\apache-maven-3.9.6\bin\mvn.cmd"
}

if (-not (Test-Path $mavenCmd)) {
    throw "Bundled Maven not found at $mavenCmd. Please run standard mvn spring-boot:run if you have Maven installed."
}

Write-Host "Starting Spring Boot backend using Maven..."
& $mavenCmd spring-boot:run
