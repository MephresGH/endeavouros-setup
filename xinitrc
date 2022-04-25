#!/bin/sh
case $WM in
plasma)
	exec startplasma-x11
	;;

xfce)
    exec xfce4-session
    ;;
esac
