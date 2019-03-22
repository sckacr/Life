#!/bin/sh

fcitx-autostart
fcitx-configtool &
/usr/lib/mozc/mozc_tool --mode=config_dialog &
