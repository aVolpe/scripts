#/bin/bash

cmus-remote -Q | head -2 | tail -1 | sed -e 's/.*\///' -e 's/\..*//' | xargs -0 -I{} kdialog --title "Cmus" --passivepopup {} 5
