# git-sync

git-sync is a simple image that pulls a git repository into a local directory.
It is a perfect "sidecar" container in Kubernetes - it can periodically pull
files down from a repository so that an application can consume them.

git-sync can pull one time, or on a regular interval. 

git-sync can only pull over HTTPS with authentication.

## Parameters

|Environment Variable|Description|Default|
|-|-|-|
|GIT_SYNC_REPO|the git repository to clone | ""|
|GIT_SYNC_ROOT|the root directory for git-sync operations| /git|
|GIT_SYNC_BRANCH|the git branch to check out | main|
|GIT_SYNC_DEST|the name of a directory in which to check-out files| repo|
|GIT_SYNC_ONE_TIME|exit after the first sync | false|
|GIT_SYNC_WAIT|the number of seconds between syncs | 120|
|GIT_SYNC_USERNAME|the username to use for git auth | ""|
|GIT_SYNC_PASSWORD|the password or personal access token to use for git auth. | ""|