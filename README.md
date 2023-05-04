# dotfiles
My personal configuration files for a linux setup. I use [gnu stow](https://www.gnu.org/software/stow/) to manage the files. 
This repo mimics the structure of a user home directory and exists in *$HOME/.dotfiles*.

## Requirements
- This repo should exist in home directory. (~/.dotfiles)
- The program *stow* should be installed

## Install All
`stow .`

## Delete All Installed Symlinks
`stow -D .`
