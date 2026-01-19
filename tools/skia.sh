#!/system/bin/sh
# Force Skia Vulkan for UI Rendering
# Note: For non-root, some of these might only apply after reboot or to specific apps via AxManager

# Set Skia Vulkan as the main rendering pipeline
settings put global debug.hwui.renderer skiavk

# Disable Skia OpenGL (to ensure SkiaVK is used)
setprop debug.hwui.renderer skiavk
setprop persist.sys.ui.hw skiavk

# Threading optimizations for Skia
setprop debug.skia.num_render_threads 4
setprop debug.skia.threaded_render true

echo "Skia Vulkan pipeline requested."
