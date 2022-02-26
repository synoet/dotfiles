#!/usr/bin/env bash

##Author:	Teo Nys
##Discord: 	@nysteo#2718
##Github:	@nysteo
##Website:	www.nysteo.com

theme="orion"

dir="$HOME/.config/rofi"
styles=($(ls -p --hide="colors.rasi" $dir/styles))

rofi -no-lazy-grab -show drun \
	-modi run,drun,window \
	-theme $dir/$theme
