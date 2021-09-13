#!/bin/bash

REPO_PATH=${GIT_SYNC_ROOT:-"/git"}/${GIT_SYNC_DEST:-"repo"}

GIT_SYNC_REPO=$(echo ${GIT_SYNC_REPO} |sed 's~http[s]*://~~g')

git_clone() {
	git clone -b ${GIT_SYNC_BRANCH:-main} https://${GIT_SYNC_USERNAME}:${GIT_SYNC_PASSWORD}@${GIT_SYNC_REPO} ${REPO_PATH}

	if [ "$?" -ne 0 ]
	then
		exit 1
	fi
}

git_pull(){
  git pull
}

rm -rf {*,.*}

git_clone

cd ${REPO_PATH}

while [ ${GIT_SYNC_ONE_TIME:-false} != true  ]
do 
	sleep ${GIT_SYNC_WAIT:-120}
	git_pull
done