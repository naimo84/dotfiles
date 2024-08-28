# naimo84's dotfiles

My configuration, managed by [chezmoi](https://github.com/twpayne/chezmoi). 

Minimalist, but helps save a few thousand keystrokes a day. I use macOS, Debian 12 and Ubuntu 20.04/22.04, so I can only guarantee they'll work on a Mac, Debian or Ubuntu.

You may also be interested in my [Devenv Ansible Playbook](https://github.com/naimo84/ansible-devenv-playbook), which configures a Mac/Ubuntu using Ansible, and incorporates the installation and updating of a set of dotfiles like this one.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply naimo84
```