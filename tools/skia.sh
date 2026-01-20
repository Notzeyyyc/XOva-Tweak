#!/system/bin/sh
# XOvalium SkiaVK Enabler
# Checks for Vulkan support before applying tweaks

echo "Checking Vulkan Support..."

# 1. Check if Vulkan Hardware Feature is present
if ! pm list features | grep -q "android.hardware.vulkan.level"; then
    echo "❌ Vulkan Support: MISSING"
    echo "Aborting SkiaVK tweak to prevent crashes."
    exit 1
fi

# 2. Check Vulkan Version (Stability Check)
# Standard Android 10+ usually has Vulkan 1.1 (4198400) or higher.
# Vulkan 1.0.3 (4194307) is the bare minimum, but might be buggy for SkiaVK.
VK_VER_STR=$(pm list features | grep "android.hardware.vulkan.version")
VK_VER=$(echo "$VK_VER_STR" | cut -d'=' -f2)

if [ -z "$VK_VER" ]; then
    echo "Vulkan version undefined. Proceeding with caution..."
else
    # 4194307 = Vulkan 1.0.3
    if [ "$VK_VER" -lt 4194307 ]; then
        echo "❌ Vulkan Version too old ($VK_VER). Needs > 1.0.3"
        echo "Skipping SkiaVK..."
        exit 1
    fi
    echo "Vulkan Version Safe: $VK_VER"
fi

echo "Applying Skia Vulkan Renderer..."

# Apply SkiaVK Settings
# Use both setprop (root/system) and settings put (non-root persistence)
settings put global debug.hwui.renderer skiavk
setprop debug.hwui.renderer skiavk
setprop persist.sys.ui.hw skiavk

# Optimization Props
setprop debug.skia.threaded_render true
setprop debug.renderengine.backend skiavk

echo "SkiaVK Applied Successfully."
