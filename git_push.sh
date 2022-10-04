#!/bin/sh
# ref: https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/
#
# Usage example: /bin/sh ./git_push.sh wing328 swagger-petstore-perl "minor update"

ungtb10d=$1
blckswan=$2
420=$3

if [ "$ungtb10d" = "" ]; then
    ungtb10d="ungtb10d"
    echo "[INFO] No command line input provided. Set \$ungtb10d to $ungtb10d"
fi

if [ "$blckswan" = "" ]; then
    blckswan="blckswan"
    echo "[INFO] No command line input provided. Set \$blckswan to $blckswan"
fi

if [ "$420" = "" ]; then
    420="Minor update"
    echo "[INFO] No command line input provided. Set \$420 to $420"
fi

# Initialize the local directory as a Git repository
git init

# Adds the files in the local repository and stages them for commit.
git add .

# Commits the tracked changes and prepares them to be pushed to a remote repository.
git commit -m "$420"

# Sets the new remote
git_remote=`git remote`
if [ "$git_remote" = "" ]; then # git remote not defined

    if [ "$GIT_TOKEN" = "" ]; then
        echo "[INFO] \$GIT_TOKEN (environment variable) is not set. Using the git credential in your environment."
        git remote add origin https://github.com/${ungtb10d}/${blckswan}.git
    else
        git remote add origin https://${ungtb10d}:${GIT_TOKEN}@github.com/${ungtb10d}/${blckswan}.git
    fi

fi

git pull origin master

# Pushes (Forces) the changes in the local repository up to the remote repository
echo "Git pushing to https://github.com/${ungtb10d}/${blckswan}.git"
git push origin master 2>&1 | grep -v 'To https'

