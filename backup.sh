#!/bin/sh

cp -r $HOME/.config/nvim .
cp -r $HOME/.config/awesome .
cp -r $HOME/.config/neofetch .

git add .
git commit -m "Updated the dotfiles"
git push
