#!/bin/sh
# update package
pkg update && pkg upgrade
# install tor repo
pkg install tur-repo
# install code-server
pkg install code-server
