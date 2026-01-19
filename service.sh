# XOvalium Persistent Service
# Applied at boot

# 1. Global Performance Settings (Safe)
settings put global window_animation_scale 0.5
settings put global transition_animation_scale 0.5
settings put global animator_duration_scale 0.5

# 2. Battery Monitor (Run in background)
sh /data/adb/modules/xovalium/tools/gugugaga.sh &

echo "XOvalium Boot Service Finished."
