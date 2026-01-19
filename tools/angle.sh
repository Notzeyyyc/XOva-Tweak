#!/system/bin/sh
# Force ANGLE (OpenGL over Vulkan) Graphic Driver
# This helps in some games for consistency

# Enable ANGLE for all apps
settings put global angle_enabled_all_packages 1

# Select ANGLE as the driver
settings put global angle_gl_driver_selection_pkgs ""
settings put global angle_gl_driver_selection_values ""

# Set default driver to angle
settings put global angle_gl_driver_all_angle 1

# Performance properties for ANGLE
setprop debug.angle.backend vulkan
setprop debug.angle.vulkan.instance 1

echo "ANGLE Driver (Vulkan backend) enabled for all packages."
