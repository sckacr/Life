sudo timedatectl set-ntp true

pulseaudio --start

fcitx-autostart
fcitx-configtool &
/usr/lib/mozc/mozc_tool --mode=config_dialog &
