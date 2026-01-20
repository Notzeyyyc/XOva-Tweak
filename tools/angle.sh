#!/system/bin/sh
# XOvalium ANGLE Driver Enabler (Vulkan Backend)
# Optimized for Android 10 - 14

echo "Checking ANGLE environment..."

# 1. Safety Check: Is ANGLE library available?
# Common locations for ANGLE libs
if [ ! -f /system/lib64/libangle.so ] && \
   [ ! -f /vendor/lib64/libangle.so ] && \
   [ ! -f /product/lib64/libangle.so ] && \
   ! ls /apex/com.android.angle/lib64/libangle.so >/dev/null 2>&1; then
    echo "Warning: ANGLE libraries not found in standard paths."
    echo "Force-enabling might cause crashes. Proceeding anyway..."
fi

echo "Applying Global ANGLE Settings..."

# 2. Global Enable (Android 12/13/14+)
# This forces ANGLE for all apps that support it
settings put global angle_gl_driver_all_angle 1

# 3. Legacy Enable (Android 10/11)
settings put global angle_enabled_all_packages 1

# 4. Clear Per-App Conflicts
# We want global mode, so we clear individual app exceptions
settings put global angle_gl_driver_selection_pkgs ""
settings put global angle_gl_driver_selection_values ""

# 5. Backend Configuration
# Force ANGLE to use Vulkan (instead of GLES-on-GLES or default)
setprop debug.angle.backend vulkan

# 6. Quality of Life
# Disable the "ANGLE in use" dialog/toast
settings put global show_angle_in_use_dialog_box 0
# Disable on-screen overlay
setprop debug.angle.overlay 0

echo "ANGLE Driver (Vulkan) forced globally."
echo "Note: If apps crash, disable this via developer options or reboot."
