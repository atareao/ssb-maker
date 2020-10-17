#!/bin/bash

# Copyright (c) 2020 Lorenzo Carbonell Cerezo <a.k.a. atareao>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Check if Firefox exists
if [ ! -f /usr/bin/firefox ]
then
    echo "Firefox must be installed"
    exit -1
fi

# Check if Firefox is working
ans=$(pgrep -f firefox)
out=$?
if [ $out -eq 0 ]
then
    echo "Please close Firefox and run this script again"
    exit -1
fi

# If directory doesn't exists create it
if [ ! -d "${HOME}/.mozilla/firefox" ]
then
    mkdir -p "${HOME}/.mozilla/firefox"
fi

# Check if todoist profile exists
cd "${HOME}/.mozilla/firefox"
cp profiles.ini profiles.ini.back
ans=$(grep -Ei "name\s*=\s*todoist" profiles.ini)
out=$?
if [ $out -eq 0 ]
then
    cat profiles.ini | tr '\n' '\r' | sed 's/\[Profile[0-9]*\]\r[Nn]ame\s*=\s*todoist\r[^\[]*//' | tr '\r' '\n' > profiles.ini.new
    mv profiles.ini.new profiles.ini
    profile=$(find -maxdepth 1 -type d -name "*.todoist")
    out=$?
    if [ $out -eq 0 ]
    then
        rm -rf $profile
    fi
fi

# Create the WhatsApp profile
/usr/bin/firefox -CreateProfile todoist

# Set preferences
profile=$(find -maxdepth 1 -type d -name "*.todoist")
cd $profile
echo 'user_pref("browser.ssb.enabled", true);' > prefs.js

ICONDIR="${HOME}/.local/share/icons"
if [ ! -d $ICONDIR ]
then
    mkdir -p $ICONDIR
fi
ICONAPP="${ICONDIR}/todoist.svg"
cat << 'EOF' > $ICONAPP
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   id="Layer_1"
   x="0px"
   y="0px"
   viewBox="0 0 256 256"
   xml:space="preserve"
   width="256"
   height="256"><metadata
   id="metadata22"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs20">
<filter
   style="color-interpolation-filters:sRGB"
   id="filter869"><feFlood
     flood-opacity="0.498039"
     flood-color="rgb(0,0,0)"
     result="flood"
     id="feFlood859" /><feComposite
     in="flood"
     in2="SourceGraphic"
     operator="in"
     result="composite1"
     id="feComposite861" /><feGaussianBlur
     in="composite1"
     stdDeviation="3"
     result="blur"
     id="feGaussianBlur863" /><feOffset
     dx="0"
     dy="0"
     result="offset"
     id="feOffset865" /><feComposite
     in="SourceGraphic"
     in2="offset"
     operator="over"
     result="composite2"
     id="feComposite867" /></filter></defs>
<style
   type="text/css"
   id="style2">
	.st0{fill:#E44432;}
	.st1{fill:#FFFFFF;}
</style>
<g
   id="g893"
   transform="matrix(2.3238924,0,0,2.3238924,-135.5294,-452.97311)"><path
     id="XMLID_16_"
     class="st0"
     d="M 147.8,204.1 H 79 c -6.3,0 -11.5,5.2 -11.5,11.5 v 68.8 c 0,6.3 5.2,11.5 11.5,11.5 h 68.8 c 6.3,0 11.5,-5.2 11.5,-11.5 v -68.8 c 0,-6.3 -5,-11.5 -11.5,-11.5 z"
     style="filter:url(#filter869)" /><path
     id="XMLID_17_"
     class="st1"
     d="m 87.1,247.1 c 1.7,-0.8 36.3,-20.9 37.1,-21.3 0.8,-0.4 0.8,-1.9 0,-2.3 -0.8,-0.4 -2.5,-1.5 -3.1,-1.9 -0.6,-0.4 -1.9,-0.6 -2.9,0 -0.4,0.2 -30,17.3 -31.1,17.9 -1.3,0.6 -2.7,0.6 -3.8,0 -0.8,-0.6 -15.6,-9.2 -15.6,-9.2 v 7.7 c 3.8,2.3 13.3,7.7 15.6,9 1.3,0.9 2.6,0.9 3.8,0.1 z" /><path
     id="XMLID_18_"
     class="st1"
     d="m 87.1,262.5 c 1.7,-0.8 36.3,-20.9 37.1,-21.3 0.8,-0.4 0.8,-1.9 0,-2.3 -0.8,-0.4 -2.5,-1.5 -3.1,-1.9 -0.6,-0.4 -1.9,-0.6 -2.9,0 -0.4,0.2 -30,17.3 -31.1,17.9 -1.3,0.6 -2.7,0.6 -3.8,0 -1,-0.6 -15.9,-9.2 -15.9,-9.2 v 7.7 c 3.8,2.3 13.3,7.7 15.6,9 1.6,0.9 2.9,0.9 4.1,0.1 z" /><path
     id="XMLID_19_"
     class="st1"
     d="m 87.1,277.9 c 1.7,-0.8 36.3,-20.9 37.1,-21.3 0.8,-0.4 0.8,-1.9 0,-2.3 -0.8,-0.4 -2.5,-1.5 -3.1,-1.9 -0.6,-0.4 -1.9,-0.6 -2.9,0 -0.4,0.2 -30,17.3 -31.1,17.9 -1.3,0.6 -2.7,0.6 -3.8,0 -0.8,-0.6 -15.6,-9.2 -15.6,-9.2 v 7.7 c 3.8,2.3 13.3,7.7 15.6,9 1.3,1 2.6,1 3.8,0.1 z" /></g>
</svg>
EOF
APPDIR="${HOME}/.local/share/applications"
if [ ! -d $APPDIR ]
then
    mkdir -p $APPDIR
fi
LAUNCHAPP="${APPDIR}/todoist-webapp.desktop"
if [ -f $LAUNCHAPP ]
then
    rm $LAUNCHAPP
fi
cat << 'EOF' > $LAUNCHAPP
#!/usr/bin/env xdg-open
[Desktop Entry]
Name=Todoist
GenericName=Todoist
Comment=Todoist desktop webapp
Exec=/usr/bin/firefox -ssb https://todoist.com/app/#start -P todoist
Terminal=false
Type=Application
Icon=todoist
StartupNotify=true
MimeType=text/plain;
Categories=Network;Application;
Keywords=Todoist;webapp;
X-Ubuntu-Gettext-Domain=Todoist
StartupWMClass=todoist.com
EOF
