#!/usr/bin/env sh

# abort on errors
set -e
rm -rf dist
# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git checkout -b main
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:georgius1024/heatmap-24-7.git main:gh-pages
echo https://georgius1024.github.io/heatmap-24-7
cd -