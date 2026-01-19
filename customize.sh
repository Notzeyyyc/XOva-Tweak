# XOvalium Project - Installer Script
# Optimized for Plug n Play stability

ui_print "--------------------------------------"
ui_print "         XOVALIUM PROJECT             "
ui_print "     Testing for XOS Framework        "
ui_print "--------------------------------------"

# Basic Environment Check
if [ "$AXERON" = "true" ]; then
    ui_print "- AxManager detected"
else
    ui_print "- Magisk/KernelSU detected"
fi

ui_print "- Installing XOvalium tools..."

# The system will automatically extract files to $MODPATH
# We just need to set permissions for our tools
ui_print "- Setting permissions..."
set_perm_recursive $MODPATH/tools 0 0 0755 0755
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/action.sh 0 0 0755

ui_print "- Installation Successful!"
ui_print "--------------------------------------"
ui_print "  Join @Notzeyyyc for updates         "
ui_print "--------------------------------------"
