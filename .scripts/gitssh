#!/bin/sh

ssh-keygen -o -t rsa -C "adityastomar12@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
