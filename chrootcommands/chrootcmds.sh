#!/bin/bash

# Why in gods name do I go through this? Potentially hazarderess apps run in
# there own environment so if something nasty happens they don't have access to
# my $HOME and more.

export DISPLAY=":0.0"

function firefox {
    export HOME="/home/browser"
    sudo -H -u browser firefox
}

function gajim {
    export HOME="/home/chat"
    sudo -H -u chat gajim
}

function irssi {
 export HOME="/home/irc"
 sudu -H -u irc irssi
} 

function xchat {
 export HOME="/home/irc"
 sudu -H -u irc xchat
} 
