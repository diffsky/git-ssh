#!/bin/bash
# http://stackoverflow.com/questions/2462317/bash-syntax-error-redirection-unexpected
config="config"
if [ -z "$GIT_PATH" ];then
  export GIT_PATH=$(which git)
fi

# vagrant workaround for no $HOME in env causing git to fail
if [ -z "$HOME" ]; then
  if [ "$(id -u)" == "0" ]; then
    export HOME="/root"
  else
    export HOME="/home/$(whoami)"
  fi
fi

GIT_CORP_ORG=$($GIT_PATH config --global corp.org)
CORP_SSH=$($GIT_PATH config --global corp.ssh)

IFS=';' read -ra ADDR <<< "$GIT_CORP_ORG"
for i in "${ADDR[@]}"; do
  if [[ "$@" == *"${i}"* ]]; then
    config="${CORP_SSH}"
    break
  fi
done
exec ssh -F "$HOME/.ssh/$config" "$@"
