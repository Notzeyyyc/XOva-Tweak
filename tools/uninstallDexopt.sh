#!/system/bin/sh
VERSION=$(getprop ro.build.version.release)
SDK_VER=$(getprop ro.build.version.sdk)

if [ "$SDK_VER" -le 33 ]; then
    cmd="pm compile --reset "
elif [ "$SDK_VER" -ge 34 ]; then
    cmd="pm art clear-app-profiles "
fi
