git clone https://github.com/w11dcard/boilerplate-next .
git remote remove origin
Remove-Item README.md
New-Item .env
npm install

$repoName = Read-Host -Prompt "Enter GitHub repository name"
$jsonData = @{
    name = $repoName
    private = $true
} | ConvertTo-Json

$headers = @{
    Authorization = "token $($env:GITHUB_TOKEN)"
    Accept = "application/vnd.github.v3+json"
}

Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $jsonData
