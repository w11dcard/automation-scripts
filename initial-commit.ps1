# Set GitHub username from environment variable
$githubUsername = $env:GITHUB_USERNAME

# Set GitHub repository name from user input
$repoName = Read-Host -Prompt "Enter GitHub repository name"

# Set the repository URL using GitHub username & GitHub repository name
$repoUrl = "https://github.com/$githubUsername/$repoName.git"

# Add the remote origin, add files, commit, and push to main branch
git remote add origin $repoUrl
git add .
git commit -m "Initial Commit"
git branch -M main
git push -u origin main
