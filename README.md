

install lemminx
cd /opt
sudo git clone https://github.com/eclipse/lemminx.git --depth 1
cd lemminx
sudo mvn clean install

## Enabled tab-to-click on Debian "laptop Lenovo notepad"
`sudo apt install xserver-xorg-input-libinput`
`sudo vim /etc/X11/xorg.conf.d/40-libinput.conf`
`Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        Option "Tapping" "on"
        Driver "libinput"
EndSection`
