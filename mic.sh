#!/bin/sh

pactl set-card-profile alsa_card.usb-Elgato_Systems_Elgato_Wave_3_BS31K1A05528-00 output:analog-stereo
pactl set-card-profile alsa_card.usb-Elgato_Systems_Elgato_Wave_3_BS31K1A05528-00 input:mono-fallback
