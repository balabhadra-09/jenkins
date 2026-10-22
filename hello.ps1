
 
Write-Output " my World my jaan my cutie my everything my sweetheart!"
Write-Output " hello my love my darling my honey my anjel my sunshine!"
Write-Output "Docker username received: $env:DOCKER_USER"
Write-Output "Password received: $([bool]$env:DOCKER_PASS)"
$docker = "C:\Users\beher\AppData\Local\Programs\DockerDesktop\resources\bin\docker.exe"

Write-Output "Docker username received: $env:DOCKER_USER"
Write-Output "Password received: $([bool]$env:DOCKER_PASS)"

$password = $env:DOCKER_PASS.Trim()
$password | & $docker login -u $env:DOCKER_USER --password-stdin

if ($LASTEXITCODE -ne 0) { exit 1 }

