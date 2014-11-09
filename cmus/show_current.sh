#/bin/bash

date=`date +%d-%m\ %H:%M:%S`

cmus-remote -Q | head -2 | tail -1 | sed -e 's/.*\///' -e 's/\..*//' | xargs -0 -I{} kdialog --title "$date" --passivepopup {} 2
