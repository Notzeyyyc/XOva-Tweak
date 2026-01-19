#!/system/bin/sh
# XOvalium Performance Engine
# Focused on CPU/GPU and background process limits

PKG=$1

echo "Applying Performance Tweak..."

# 1. Background Process Limit (Set to 3)
# This forces the system to kill cached apps more aggressively to spawn more RAM
echo "Setting Background Process Limit to 3..."
cmd activity set-process-limit 3

# 2. CPU/GPU Power Mode
# Sustained performance mode (usually disables thermal throttling slightly and holds clocks higher)
echo "Forcing Sustained Performance Mode..."
cmd power set-mode 0

# 3. Game Mode Optimization (Android 12+)
if [ ! -z "$PKG" ]; then
    echo "Applying Game Mode for $PKG..."
    cmd game mode set performance "$PKG" >/dev/null 2>&1
fi

# 4. Kernel/System Props (Non-Root safe)
# Disabling aggressive background scanning to save CPU cycles
settings put global background_process_limit 3
settings put global window_animation_scale 0.5
settings put global transition_animation_scale 0.5
settings put global animator_duration_scale 0.5

echo "Performance Tweaks Applied Successfully."
