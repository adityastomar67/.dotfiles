#!/bin/bash
# Script to Download my Updated Wallpapers from Github

# Check if the directory exists already and delete it
[ -d "$HOME/.config/wall" ] && rm -rf ~/.config/wall

# Clone it to the perfect location
git clone https://github.com/adityastomar67/Wallpapers "$HOME/.config/wall"

# Move all the static wallpapers to `wall` directory and select the files with .png extension
cd "$HOME/.config/wall" || exit
mv Static/* .
/usr/bin/ls | grep "wall[0-9]*.png" > list.txt

# Move all the .png files to .jpg
list="./list.txt"
while IFS= read -r file ; do
  mv -- "$file" "${file%.png}.jpg"
done < "$list"

# Remove unnecessary files and set wallpaper
command rm -rf .git/ README.md Static list.txt
[ -f "$HOME/.wallpy" ] && ~/.wallpy
