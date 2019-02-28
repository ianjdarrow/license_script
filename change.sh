#!/usr/bin/env bash
REPO="$1"
NOW=`date +%Y-%m-%d`
BRANCH="LICENSE-CHANGE-$NOW"
URL="git@github.com:filecoin-project/$REPO.git"
echo "Cloning $URL"
git clone "$URL" .
git checkout -b "$BRANCH"

ls |  grep -i license | xargs rm -v
CPY="$HOME/Code/license_script/COPYRIGHT"
MIT="$HOME/Code/license_script/LICENSE-MIT"
APA="$HOME/Code/license_script/LICENSE-APACHE"
cp $CPY $MIT $APA .

git add -u
git add COPYRIGHT LICENSE-MIT LICENSE-APACHE

git commit -m "Update license to MIT/Apache-2"
git push origin HEAD
hub pull-request -m "Update license to MIT/Apache-2"

cd .. && rm -rf changes/ && mkdir changes && cd changes
