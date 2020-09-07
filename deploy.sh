set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:dmitriygalyanov/medods-test-task-2.git master:gh-pages

cd -