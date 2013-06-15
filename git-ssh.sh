#!/bin/sh
config="config"
GIT_CORP_ORG=$(git config --global corp.org)
CORP_SSH=$(git config --global corp.ssh)

IFS=';' read -ra ADDR <<< "$GIT_CORP_ORG"
for i in "${ADDR[@]}"; do
  if [[ "$@" == *"${i}"* ]]; then
    config="${CORP_SSH}"
  fi
done

exec ssh -F "$HOME/.ssh/$config" "$@"