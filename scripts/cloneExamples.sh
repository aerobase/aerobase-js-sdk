set -eo pipefail

echo "Development script that clones example application to be available in the repository"
git clone git@github.com:aerobase-demo/angular-oauth2-starter.git cordova-example

cd cordova-example
npm install

echo "Example application cloned with success."
