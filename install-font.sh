#!/bin/sh

set -xe

FONT_FILE_NAME=PkgTTF-IosevkaTermSS02-33.2.1.zip

# Create font home location
mkdir $HOME/.local/share/fonts/iosevka-SS02-term

cd $HOME/.local/share/fonts/iosevka-SS02-term

# Download the font
wget https://github.com/be5invis/Iosevka/releases/download/v33.2.1/$FONT_FILE_NAME 

# Expand the font files
unzip $FONT_FILE_NAME

echo "Done!"
