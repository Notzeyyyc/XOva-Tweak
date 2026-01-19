# DO NOT add blocking or long-running operations here.
# This script is executed during early boot.
# Blocking this stage WILL cause the system to hang or bootloop.
if [ "$AXERON" = "true" ]; then
    # Implement your own non-root / early-boot–safe logic here.
    echo "preparing..."
fi
