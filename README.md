# git-ssh

Automatically use a specific ssh config file when working with certain github (corp) org

## Usage

- Clone the repo
- `export GIT_SSH=path/to/git-ssh.sh` # for example, in your bash profile

`git-ssh.sh` checks the git operation for a specified match (specified in your global git config).
If a *corporate* repo is detected it will use a specified ssh config for the operation. This allows
you to use a separate ssh key.

## Config

Set the following values:

    git config --global corp.org "value to search for in git ref to identify the corp repo"
    git config --global corp.ssh "ssh config filename inside of $HOME/.ssh/ to use"

The `corp.org` supports multiple values to search for, separated by `;`, like `org1;org2`

## See also

[git.corp](https://github.com/diffsky/git.corp) to ensure you always commit as your corp user account