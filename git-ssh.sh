#!/bin/sh
config="config"
GIT_CORP_ORG=$(git config --global corp.org)
CORP_SSH=$(git config --global corp.ssh)

IFS=';' read -ra ADDR <<< "$GIT_CORP_ORG"
for i in "${ADDR[@]}"; do
  if [[ "$@" == *"${i}"* ]]; then
    config="${CORP_SSH}"
    break
  fi
done
if [ -z "config" ];then
  exec ssh "$@"
else
  exec ssh -F "$HOME/.ssh/$config" "$@"
fi
