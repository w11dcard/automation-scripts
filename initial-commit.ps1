# This script creates an initial commit of a project to a GitHub repository, with the "Initial Commit" message

# Get the repository URL from the .git folder and the GitHub username from the environment variable
$repoUrl = git config --get remote.origin.url
$githubToken = $env:GITHUBTOKEN

# Set the repository URL using GitHub username & GitHub repository name
$repoUrl = "https://$githubToken@github.com/$repoName.git"

# Add the remote origin, add files, commit, and push to main branch
git remote add origin $repoUrl
git add .
git commit -m "Initial Commit"
git branch -M main
git push -u origin main
