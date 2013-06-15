#!/bin/sh
config="config"
GIT_CORP_ORG=$(git config --global corp.org)
CORP_SSH=$(git config --global corp.ssh)
if [[ "$@" == *"${GIT_CORP_ORG}"* ]]; then
  config="${CORP_SSH}"
fi
exec ssh -F "$HOME/.ssh/$config" "$@"