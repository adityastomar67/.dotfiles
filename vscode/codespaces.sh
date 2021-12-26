#!/usr/bin/env bash

set -e

# Installing zplug
export ZPLUG_HOME="$HOME/.dotfiles/.zplug"
git clone 'https://github.com/zplug/zplug' "$ZPLUG_HOME"
