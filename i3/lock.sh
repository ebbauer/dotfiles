#!/bin/bash

TEMPDIR=$HOME/tmp

sh ~/.config/i3/individual_scrot.sh
convert $TEMPDIR/head_0.png -scale 10% -scale 1000% $TEMPDIR/head_0.png
[[ -f $HOME/pictures/misc/lock-image.png ]] && convert $TEMPDIR/head_0.png $HOME/pictures/misc/lock-image.png -gravity center -composite -matte $TEMPDIR/head_0.png
if [ -e $TEMPDIR/head_1.png ]; then
  convert $TEMPDIR/head_1.png -scale 10% -scale 1000% $TEMPDIR/head_1.png
  [[ -f $HOME/pictures/misc/lock-image.png ]] && convert $TEMPDIR/head_1.png $HOME/pictures/misc/lock-image.png -gravity center -composite -matte $TEMPDIR/head_1.png
  convert $TEMPDIR/head_0.png $TEMPDIR/head_1.png +append $TEMPDIR/screen.png
else
  mv $TEMPDIR/head_0.png $TEMPDIR/screen.png
fi
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i $TEMPDIR/screen.png
