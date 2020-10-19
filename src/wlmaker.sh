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

# Check if whatsapp profile exists
cd "${HOME}/.mozilla/firefox"
cp profiles.ini profiles.ini.back
ans=$(grep -Ei "name\s*=\s*whatsapp" profiles.ini)
out=$?
if [ $out -eq 0 ]
then
    cat profiles.ini | tr '\n' '\r' | sed 's/\[Profile[0-9]*\]\r[Nn]ame\s*=\s*whatsapp\r[^\[]*//' | tr '\r' '\n' > profiles.ini.new
    mv profiles.ini.new profiles.ini
    profile=$(find -maxdepth 1 -type d -name "*.whatsapp")
    out=$?
    if [ $out -eq 0 ]
    then
        rm -rf $profile
    fi
fi

# Create the WhatsApp profile
/usr/bin/firefox -CreateProfile whatsapp

# Set preferences
profile=$(find -maxdepth 1 -type d -name "*.whatsapp")
cd $profile
echo 'user_pref("browser.ssb.enabled", true);' > prefs.js
echo 'user_pref("browser.sessionstore.resume_session_once",true);' >> prefs.js

ICONDIR="${HOME}/.local/share/icons"
if [ ! -d $ICONDIR ]
then
    mkdir -p $ICONDIR
fi
ICONAPP="${ICONDIR}/whatsapp.svg"
cat << 'EOF' > $ICONAPP
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:xlink="http://www.w3.org/1999/xlink"
   width="256"
   height="255.99997"
   viewBox="0 0 67.733336 67.73332"
   version="1.1"
   id="svg3282">
  <defs
     id="defs3276">
    <filter
       style="color-interpolation-filters:sRGB"
       id="filter3171">
      <feFlood
         flood-opacity="0.498039"
         flood-color="rgb(0,0,0)"
         result="flood"
         id="feFlood3161" />
      <feComposite
         in="flood"
         in2="SourceGraphic"
         operator="in"
         result="composite1"
         id="feComposite3163" />
      <feGaussianBlur
         in="composite1"
         stdDeviation="10"
         result="blur"
         id="feGaussianBlur3165" />
      <feOffset
         dx="0"
         dy="0"
         result="offset"
         id="feOffset3167" />
      <feComposite
         in="SourceGraphic"
         in2="offset"
         operator="over"
         result="composite2"
         id="feComposite3169" />
    </filter>
    <linearGradient
       xlink:href="#linear1"
       id="linearGradient3159"
       x1="-165.0213"
       y1="-129.80733"
       x2="-163.9595"
       y2="-7.9280939"
       gradientUnits="userSpaceOnUse"
       gradientTransform="translate(-64.226213,-54.403131)" />
    <linearGradient
       gradientTransform="matrix(0,-420.76019,420.76019,0,640.24524,746.25035)"
       y2="0"
       x2="1"
       y1="0"
       x1="8.3254099e-07"
       gradientUnits="userSpaceOnUse"
       id="linear1">
      <stop
         id="stop3126"
         style="stop-color:#5cd468;stop-opacity:1"
         offset="0" />
      <stop
         id="stop3128"
         style="stop-color:#57cf61;stop-opacity:1"
         offset="0.125" />
      <stop
         id="stop3130"
         style="stop-color:#47c757;stop-opacity:1"
         offset="0.25" />
      <stop
         id="stop3132"
         style="stop-color:#42c553;stop-opacity:1"
         offset="0.375" />
      <stop
         id="stop3134"
         style="stop-color:#3dbf4c;stop-opacity:1"
         offset="0.5" />
      <stop
         id="stop3136"
         style="stop-color:#35bc47;stop-opacity:1"
         offset="0.625" />
      <stop
         id="stop3138"
         style="stop-color:#2eb842;stop-opacity:1"
         offset="0.75" />
      <stop
         id="stop3140"
         style="stop-color:#26b33d;stop-opacity:1"
         offset="0.875" />
      <stop
         id="stop3142"
         style="stop-color:#21b038;stop-opacity:1"
         offset="1" />
    </linearGradient>
    <linearGradient
       xlink:href="#linear1"
       id="linearGradient3151"
       x1="-866.44727"
       y1="-696.22852"
       x2="-862.43414"
       y2="-235.5826"
       gradientUnits="userSpaceOnUse"
       gradientTransform="matrix(0.26458333,0,0,0.26458333,-1.293615e-5,2.9894298e-6)" />
    <filter
       style="color-interpolation-filters:sRGB"
       id="filter3195">
      <feFlood
         flood-opacity="0.498039"
         flood-color="rgb(0,0,0)"
         result="flood"
         id="feFlood3185" />
      <feComposite
         in="flood"
         in2="SourceGraphic"
         operator="in"
         result="composite1"
         id="feComposite3187" />
      <feGaussianBlur
         in="composite1"
         stdDeviation="3"
         result="blur"
         id="feGaussianBlur3189" />
      <feOffset
         dx="0"
         dy="0"
         result="offset"
         id="feOffset3191" />
      <feComposite
         in="SourceGraphic"
         in2="offset"
         operator="over"
         result="composite2"
         id="feComposite3193" />
    </filter>
  </defs>
  <metadata
     id="metadata3279">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g
     id="layer1"
     transform="translate(-15.270238,61.836902)">
    <g
       id="g3200"
       transform="matrix(0.38095235,0,0,0.38095235,136.46928,18.967116)">
      <path
         id="path2832"
         style="fill:#fafafa;fill-opacity:1;stroke:none;stroke-width:1.21448px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;filter:url(#filter3171)"
         d="m -866.44727,-745.67773 a 280.00052,280.00052 0 0 0 -280.00003,280 280.00052,280.00052 0 0 0 49.459,158.9082 l -29.3125,104.67578 107.5235,-28.64648 a 280.00052,280.00052 0 0 0 152.33003,45.0625 280.00052,280.00052 0 0 0 280,-280 280.00052,280.00052 0 0 0 -280,-280 z m 0,49.44921 a 230.55118,230.55118 0 0 1 230.55079,230.55079 230.55118,230.55118 0 0 1 -230.55079,230.55078 230.55118,230.55118 0 0 1 -125.42773,-37.10352 l -88.5352,23.58594 24.1368,-86.18945 a 230.55118,230.55118 0 0 1 -40.7246,-130.84375 230.55118,230.55118 0 0 1 230.55073,-230.55079 z"
         transform="scale(0.26458333)" />
      <path
         id="path2825"
         style="fill:url(#linearGradient3159);fill-opacity:1;stroke:url(#linearGradient3151);stroke-width:0.264583px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
         d="m -229.24751,-184.21046 a 60.999999,60.999999 0 0 0 -60.99988,60.9999 60.999999,60.999999 0 0 0 10.77505,34.619074 l -6.3862,22.804292 23.42494,-6.240447 a 60.999999,60.999999 0 0 0 33.18609,9.816973 60.999999,60.999999 0 0 0 60.99989,-60.999892 60.999999,60.999999 0 0 0 -60.99989,-60.9999 z" />
      <path
         style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.352777;filter:url(#filter3195)"
         d="m -247.71672,-153.94692 c -1.37804,-3.06062 -2.82773,-3.12263 -4.13687,-3.17637 -1.07211,-0.0455 -2.29857,-0.0427 -3.52364,-0.0427 -1.22646,0 -3.21772,0.46026 -4.90168,2.29994 -1.68535,1.83968 -6.43544,6.28661 -6.43544,15.33205 0,9.04545 6.5884,17.78496 7.50617,19.0128 0.91915,1.22645 12.71792,20.38117 31.40549,27.74954 15.52911,6.12401 18.68895,4.90582 22.06102,4.5999 3.37068,-0.30592 10.87685,-4.44693 12.40785,-8.739519 1.53238,-4.292591 1.53238,-7.970571 1.07349,-8.739521 -0.46026,-0.76757 -1.68533,-1.22645 -3.52502,-2.1456 -1.8383,-0.91916 -10.87685,-5.36746 -12.5622,-5.98069 -1.68534,-0.61322 -2.91041,-0.91915 -4.13686,0.92054 -1.22508,1.83968 -4.74597,5.9793 -5.81946,7.20575 -1.07211,1.22783 -2.14423,1.3808 -3.98391,0.46164 -1.8383,-0.92191 -7.75973,-2.8608 -14.78359,-9.12398 -5.4653,-4.87275 -9.15431,-10.89064 -10.2278,-12.73032 -1.07212,-1.83968 -0.11438,-2.83462 0.80753,-3.75102 0.82544,-0.82407 1.8383,-2.14698 2.75883,-3.22047 0.9164,-1.07349 1.2237,-1.83969 1.83555,-3.06476 0.61322,-1.22783 0.3073,-2.30132 -0.15297,-3.22048 -0.45888,-0.91915 -4.03214,-10.01145 -5.66649,-13.64671"
         id="path418" />
    </g>
  </g>
</svg>
EOF
APPDIR="${HOME}/.local/share/applications"
if [ ! -d $APPDIR ]
then
    mkdir -p $APPDIR
fi
LAUNCHAPP="${APPDIR}/whatsapp-webapp.desktop"
if [ -f $LAUNCHAPP ]
then
    rm $LAUNCHAPP
fi
cat << 'EOF' > $LAUNCHAPP
#!/usr/bin/env xdg-open
[Desktop Entry]
Name=WhatsApp
GenericName=WhatsApp
Comment=WhatsApp desktop webapp
Exec=/usr/bin/firefox -ssb https://web.whatsapp.com -P whatsapp
Terminal=false
Type=Application
Icon=whatsapp
StartupNotify=true
MimeType=text/plain;
Categories=Network;Application;
Keywords=WhatsApp;webapp;
X-Ubuntu-Gettext-Domain=WhatsApp
StartupWMClass=web.whatsapp.com
EOF
