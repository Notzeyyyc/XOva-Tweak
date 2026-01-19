#!/system/bin/sh
# XOvalium Dex2Opt Tool
# Optimizes app compilation for better launch speed and performance

PKG=$1

if [ -z "$PKG" ]; then
    echo "Error: No package name provided!"
    exit 1
fi

echo "Inspecting $PKG..."
if ! pm list packages | grep -q "$PKG"; then
    echo "Error: Package $PKG not found!"
    exit 1
fi

echo "Starting Speed Optimization (DexOpt)..."
# Using speed-profile for a balance between size and performance
# Or 'speed' for maximum performance (but larger file size)
cmd package compile -m speed-profile -f "$PKG"

echo "Optimization Finished for $PKG"
