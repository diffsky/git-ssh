#!/bin/sh
config="config"

# vagrant workaround for no $HOME in env causing git to fail
if [ -z "$HOME" ]; then
  HOME="/home/$(whoami)"
fi

GIT_CORP_ORG=$(/usr/bin/git config --global corp.org)
CORP_SSH=$(/usr/bin/git config --global corp.ssh)

IFS=';' read -ra ADDR <<< "$GIT_CORP_ORG"
for i in "${ADDR[@]}"; do
  if [[ "$@" == *"${i}"* ]]; then
    config="${CORP_SSH}"
    break
  fi
done
exec ssh -F "$HOME/.ssh/$config" "$@"