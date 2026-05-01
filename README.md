# .files

My configuration files

## Installation

I use my own zsh bunch of scripts for loading dotfiles called `che`. It's optimized for minimal actions needed to store configuration remotely.

```sh
che                         # shows available commands
che install <REPO>          # install 

che mkdirs                  # dirs are created, not linked, this creates tree of dirs
che mklinks                 # after dirs are created, links can be created

che add <file>              # add file to repo and push it to remote right away
che add --no-git <file>     # add file to the repo but do not do any git ops

che backup all              # in case there is a need to backup existing configuration files before cleaning and installing config from remote
che clean all               # cleanup, files, links, broken links; leaves directories alone as these may contain additional files
```