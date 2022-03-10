#!/bin/sh
git submodule deinit -f bundle/$1
git rm bundle/$1
rm -rf .git/modules/bundle/$1
