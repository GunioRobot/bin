#!/usr/bin/python
# script to copy dotfiles to svn repo and website
# Created by Oliver Kraitschy http://www.okraits.de/
# 30.06.07

import os

home_path = "/home/okraits/"
svn_path = "/home/okraits/files/svn/o_misc/trunk/configs/"
web_path = "nohostname.de:/home/okraits/htdocs/dotfiles/"

# element: [<path to file>, <path in svn>, <path in website>, <element type>]
# path in website == "-": do not copy file to website
elements = [[home_path+".SciTEUser.properties", "", "SciTEUser.properties", 0], \
            [home_path+".Xresources", "", "Xresources", 0], \
            [home_path+".bashrc", "", "bashrc", 0], \
            [home_path+".camErc", "", "camErc", 0], \
            [home_path+".config/openbox/menu.xml", "", "openbox/", 0], \
            [home_path+".config/openbox/rc.xml", "", "openbox/", 0], \
            [home_path+".conkyrc", "", "conkyrc", 0], \
            [home_path+".fonts/", "fonts", "-", 2], \
            [home_path+".gtkrc.mine", "", "gtkrc.mine", 0], \
            [home_path+".icons/", "icons", "-", 2], \
            [home_path+".irssi/", "", "irssi", 1], \
            [home_path+".mozilla/firefox/qtuymt8n.default/bookmarks.html", "", "-", 0], \
            [home_path+".pekwm/autoproperties", ".pekwm/", "pekwm/", 0], \
            [home_path+".pekwm/config", ".pekwm/", "pekwm/", 0], \
            [home_path+".pekwm/keys", ".pekwm/", "pekwm/", 0], \
            [home_path+".pekwm/menu", ".pekwm/", "pekwm/", 0], \
            [home_path+".pekwm/mouse", ".pekwm/", "pekwm/", 0], \
            [home_path+".pekwm/start", ".pekwm/", "pekwm/", 0], \
            [home_path+".pekwm/vars", ".pekwm/", "pekwm/", 0], \
            [home_path+".pekwm/themes/", ".pekwm/pekwm_themes", "", 2], \
            [home_path+".screenrc", "", "screenrc", 0], \
            [home_path+".signature", "", "-", 0], \
            [home_path+".ssh/", "", "-", 1], \
            [home_path+".themes/", "themes", "-", 2], \
            [home_path+".vimrc", "", "vimrc", 0], \
            [home_path+".xawtv", "", "xawtv", 0], \
            [home_path+".xinitrc", "", "xinitrc", 0], \
            [home_path+".zshrc", "", "zshrc", 0], \
            ["/boot/grub/menu.lst", "", "", 0], \
            ["/etc/rc.conf", "", "", 0], \
            ["/etc/fstab", "", "", 0], \
            ["/etc/X11/xorg.conf", "", "", 0], \
            ["/etc/conf.d/wireless", "", "-", 0]]

successful = 0

for element in elements:
    # files
    if element[3] == 0:
        command = "cp -f "+element[0]+" "+svn_path+element[1]
        print command
        a = os.system(command)
        if element[2] != "-":
            command = "scp "+element[0]+" "+web_path+element[2]
            print command
            b = os.system(command)
        else:
            b = 0
        if a == 0 and b == 0:
            successful += 1
        else:
            raise Exception, element[0]
    # directories
    if element[3] == 1:
        command = "cp -fr "+element[0]+" "+svn_path+element[1]
        print command
        a = os.system(command)
        if element[2] != "-":
            command = "scp -r "+element[0]+" "+web_path+element[2]
            print command
            b = os.system(command)
        else:
            b = 0
        if a == 0 and b == 0:
            successful += 1
        else:
            raise Exception, element[0]
    # directories to tar-gzip
    elif element[3] == 2:
        command = "tar -cvf "+svn_path+element[1]+".tar "+element[0]
        print command
        a = os.system(command)
        command = "gzip -f "+svn_path+element[1]+".tar "
        print command
        b = os.system(command)
        if element[2] != "-":
            command = "scp "+svn_path+element[1]+".tar.gz "+web_path+element[2]
            print command
            c = os.system(command)
        else:
            c = 0
        if a == 0 and b == 0 and c == 0:
            successful += 1
        else:
            raise Exception, element[0]
        
if successful == len(elements):
    print successful, "operations completed successfully."
# He doesn't get there because an exception is raised before
else:
    print len(elements)-successful, "/", len(elements), "operations were not successful."
