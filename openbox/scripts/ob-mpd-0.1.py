#!/usr/bin/env python
#
# ob-mpd.py
#
# ob-mpd.py displays the currently playing song from MPD in your Openbox menu.
# This script depends on py-libmpdclient which you can get from 
# http://www.musicpd.org/py-libmpdclient.shtml
#
# Usage:
# Put an entry in ~/.config/openbox/menu.xml:
# <menu id="mpd" label="MPD" execute="~/.config/openbox/scripts/ob-mpd-$version.py" />
#
# Then put the following wherever you'd like it to be displayed in your menu:
# <menu id="mpd" />

import mpdclient

# The default port for MPD is 6600.  If for some reason you have MPD running
# on a different port, change this setting to whatever you have it running on.
mpd_port = 6600

connect = mpdclient.MpdController(port=mpd_port)
song = connect.getCurrentSong()
status = connect.status()

print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
print "<openbox_pipe_menu>"
if status.stateStr() == "stop":
  print "  <item label=\"Not playing\"/>"
elif status.stateStr() == "pause":
  print "  <item label=\"Playing: %s - %s (paused)\"/>" % (song.artist, song.title)
else:
  print "  <item label=\"Playing: %s - %s\"/>" % (song.artist, song.title)
print "</openbox_pipe_menu>"
