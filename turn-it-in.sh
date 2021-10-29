#!/bin/bash

# simple script for turning in my stuff, getting the url's
# I need ruby 2.7.3 on my system... but.. I don't want to change the docker
# image to use that version... so, this is my hacky way around it so heroku
# and circleCI can use 2.7.0

./change_ruby_version.py "2.7.0" &&
bundle install &&
git add . &&
echo "Commit msg:" &&
read commit_message &&
git commit -m "$commit_message" &&
git push &&
heroku rake db:migrate &&
git push heroku main &&
./change_ruby_version.py "2.7.3" &&
bundle install

echo "GitHub: https://github.com/KevynKelso/cs3300"
echo "Heroku: https://lit-lowlands-29294.herokuapp.com/"
echo "CircleCI: https://app.circleci.com/pipelines/github/KevynKelso/cs3300"
