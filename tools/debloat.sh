#!/system/bin/sh
# XOvalium Debloat & GMS Doze for Infinix (XOS)
# Focused on RAM efficiency and battery life

# ----------------- GMS DOZE SECTION -----------------
# Forcing Google Play Services into Doze mode to save RAM
echo "Optimizing GMS..."
pm set-app-standby com.google.android.gms restricted
pm set-app-standby com.android.vending restricted

# Disable some GMS analytics and background collectors
# Note: Non-root might not be able to disable individual components,
# but we can restrict their standby bucket.

# ----------------- XOS BLOATWARE LIST (COMPREHENSIVE) -----------------
# Curated from Universal Android Debloater (UAD) & Canta recommendations.
# Safety: Excludes system launchers and critical UI components.

DEBLOAT_LIST="
# App Stores & Support
com.transsnet.store
com.transsion.carlcare
tech.palm.id
com.transsion.plat.appupdate
com.transsion.techaid

# Browsers & Media
com.talpa.hibrowser
com.transsion.phoenix
com.talpa.visha
com.transsion.lite.video
com.transsion.vivid.themestore
com.transsion.vivid.wallpaper

# Social & Party Apps
com.transsion.yo.party
com.transsion.beats.party
com.transsion.scooper
com.palmple.intl.vskit
com.talpa.share
com.talpa.instants
com.transsion.tcl.instants

# Analytics & Telemetry
com.transsion.analyzer
com.transsion.trancare
com.transsion.statistics

# System Tools (Non-critical)
com.transsion.magazinelock
com.transsion.magazineservice.xos
com.zaz.translate
com.transsion.letswitch
com.transsion.scanningcode
com.transsion.skit
com.transsion.molly
com.transsion.parentalcare
com.transsion.servicecenter
com.transsion.smartpanel

# Partner Bloat
com.shopee.id
com.lazada.android
"

echo "Debloating XOS stuff..."
for pkg in $DEBLOAT_LIST; do
    if pm list packages | grep -q "$pkg"; then
        echo "Processing: $pkg"
        pm disable-user --user 0 "$pkg" >/dev/null 2>&1
        am force-stop "$pkg" >/dev/null 2>&1
    fi
done

# Clear caches of heavy apps to free up immediate RAM
pm trim-caches 999G

echo "Debloat & GMS Optimization Done."
