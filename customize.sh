# ============================================================
# PLUGIN/MODULE ENVIRONMENT PREPARATION
#
# This section runs ONCE during installer / early execution.
# It is INTERACTIVE and BLOCKING by design.
#
# WARNING:
# - Do NOT move this code into early-boot scripts.
# - getevent + sleep WILL block execution.
# - Using this logic in boot-stage hooks may cause boot hang.
# ============================================================

ui_print "! Use volume keys to select"
ui_print "! Press power key for check"

# (OPTIONAL) Verify that getevent is functional before continuing.
# This ensures input devices are accessible.
getevent -qlc 1 >&2 && ui_print "  Check OK" || abort "! Check getevent failed"

# Small delay to avoid accidental key capture
sleep 0.5

# ------------------------------------------------------------
# (OPTIONAL) Key detection helper
#
# Reads ONE input event and maps it to a numeric choice:
#   1 = Volume Down
#   2 = Volume Up
#   3 = Power
#   0 = Unknown / unsupported input
#
# NOTE:
# - This function BLOCKS until an input event is received.
# - Safe ONLY in installer / user-interaction context.
# ------------------------------------------------------------
keyvolume() {
  local key
  key=$(getevent -qlc 1 | awk '{print $3}')
  case "$key" in
    KEY_VOLUMEDOWN|ABS_MT_TRACKING_ID) echo 1 ;; # Volume Down
    KEY_VOLUMEUP)                     echo 2 ;; # Volume Up
    KEY_POWER)                        echo 3 ;; # Power Key
    *)                                echo 0 ;; # Unknown
  esac
}

# ------------------------------------------------------------
# (OPTIONAL) AXERON-specific customization
#
# This branch enables interactive configuration using
# hardware keys.
# ------------------------------------------------------------
if [ "$AXERON" = "true" ]; then
    # AxManager customization entry point

    ui_print "Press Volume Up"
    ui_print "Press Volume Down"

    # BLOCKING call: waits for user input
    CHOICE=$(keyvolume)

    ui_print "Use AxManager: $CHOICE"
else
    ui_print "Not Use AxManager"
fi

# Final status message
ui_print "Environment Prepared"
