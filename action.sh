if [ "$AXERON" == "true" ]; then
    echo "Applying for AxManager..."
else
    echo "Applying for other.."
fi

testing #from /system/bin/testing
# XOvalium Quick Action
# Triggered from AxManager UI

echo "Applying Global System Boost..."
sh /data/data/com.android.shell/AxManager/plugins/xovalium/tools/debloat.sh
sh /data/data/com.android.shell/AxManager/plugins/xovalium/tools/clearcache.sh

echo "System Optimized!"
