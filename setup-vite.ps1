# Quickstart and setup a Vite-powered web project

# Create a new Vite project using the boilerplate repository
$projectName = Read-Host -Prompt "Enter the name for the project"
git clone https://github.com/w11dcard/boilerplate-vite $projectName
git remote remove origin
Set-Location $projectName

# Create & install necessary files
Remove-Item .git -Recurse -Force
Remove-Item README.md
New-Item README.md
New-Item .env.local
New-Item .env.production
npm install
npm install --verbose

# Create a new GitHub repository for the project
git init

$jsonData = @{
    name    = $projectName
    private = $true
} | ConvertTo-Json

$headers = @{
    Authorization = "token $($env:GITHUBTOKEN)"
    Accept        = "application/vnd.github.v3+json"
}

$response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $jsonData

# Add the remote origin
$cloneUrl = $response.clone_url
git remote add origin $cloneUrl
git remote -v
