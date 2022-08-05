#!/bin/bash

git add .
read -p "Enter commit message: " commit_message
git commit -m "$commit_message"
BRANCH=$(git describe --contains --all HEAD)
git pull --rebase origin "$BRANCH"
git push origin "$BRANCH"


# how to automate the "commit-and-push" process? (git) - Stack Overflow
# https://stackoverflow.com/questions/16709404/how-to-automate-the-commit-and-push-process-git
# https://stackoverflow.com/a/6245587/10648253
