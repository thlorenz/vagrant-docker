#! /usr/bin/env bash

apt-get update

apt-get install -y python-software-properties python g++ make

# make sure we get a good nodejs version
add-apt-repository ppa:chris-lea/node.js

# for latest tmux and such
add-apt-repository -y ppa:pi-rho/dev

# docker
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

apt-get update
apt-get install -y nodejs
apt-get install -y tmux

apt-get install -y clang

# C tooling - needed already just to install things like silver_searcher from source
apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

# setup nodejs and npm
mkdir npm-global
npm config set prefix ./npm-global

# vim and related tooling

## I know this is huge, but I want python support for my cute little plugins damnit!
apt-get install -y git vim-gnome

## clang-complete support
apt-get install -y exuberant-ctags libclang-dev

## syntastic support for javascript
npm install -g jshint

# utils

## cat files syntax highlighted via `c` command
apt-get install -y python-pygments

## silver_searcher from source
git clone https://github.com/ggreer/the_silver_searcher.git
(cd the_silver_searcher && ./build.sh && make install)
rm -rf the_silver_searcher

## latest tmux

# my dotfile setup
git clone https://github.com/thlorenz/dotfiles.git
chown -R vagrant:vagrant dotfiles

echo 'LANG=en_US.UTF-8' > /etc/default/locale

rm -f .bashrc .profile

# during provisioning ~ or $HOME seems to be /root so we need to fix that
export HOME=`pwd`

./dotfiles/scripts/create-links.sh
cp -R ./dotfiles/fonts /usr/share/

(cd ./dotfiles &&  git submodule update --init)

# docker

## https://github.com/dotcloud/docker/issues/4568#issuecomment-37259489
apt-get install -y cgroup-lite
apt-get install -y lxc-docker
