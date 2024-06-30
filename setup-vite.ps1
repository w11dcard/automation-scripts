# This script automates the setup of a Vite powered website.

# Quickstart the Vite project and install npm dependencies
git clone https://github.com/w11dcard/boilerplate-vite .
git remote remove origin
Remove-Item README.md
New-Item .env
npm install

# Set GitHub repository name from user input
$repoName = Read-Host -Prompt "Enter GitHub repository name"

# Create a new GitHub repository using GitHub API. For the initial commit, run the initial-commit.ps1 script.
$jsonData = @{
    name = $repoName
    private = $true
} | ConvertTo-Json

$headers = @{
    Authorization = "token $($env:GITHUB_TOKEN)"
    Accept = "application/vnd.github.v3+json"
}

Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $jsonData
