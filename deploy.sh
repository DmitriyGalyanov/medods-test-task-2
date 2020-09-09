set -e

npm run build

cd dist

git init
git add -A
git commit -m 'v0.2.5'

git push -f git@github.com:dmitriygalyanov/vue-js-simon-game.git master:gh-pages

cd -