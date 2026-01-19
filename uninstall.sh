# BLOCKING CONTEXT.
# DO NOT add loops, sleeps, or long-running operations here.
# This section is intended ONLY to clean up and revert
# plugin effects / environment during uninstall.
if [ "$AXERON" = "true" ]; then
    # Remove all AxManager-related components created by this plugin.
    echo "Uninstalled"
fi

# Post uninstall notification (non-blocking)
cmd notification post -t Uninstall 'Service' "$(testing)"
