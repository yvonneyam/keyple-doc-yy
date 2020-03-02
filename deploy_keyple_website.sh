#!/bin/sh

if [ "`git status -s`" ]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out website-published branch into public"
git worktree add -B website-published public origin/website-published

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo

echo "Updating website-published branch"
cd public && git add --all && git commit -m "Publishing to website-published (deploy_keyple_website.sh)"

echo "Pushing to github"
git push --all