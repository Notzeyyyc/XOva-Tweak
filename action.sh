if [ "$AXERON" == "true" ]; then
    echo "Applying for AxManager..."
else
    echo "Applying for other.."
fi

testing #from /system/bin/testing
# XOvalium Quick Action
# Triggered from AxManager UI

echo "Applying Global System Boost..."
sh /data/adb/modules/xovalium/tools/debloat.sh
sh /data/adb/modules/xovalium/tools/clearcache.sh

echo "System Optimized!"