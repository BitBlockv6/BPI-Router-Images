#!/bin/bash

# This script is executed within the OpenWrt source directory before the build starts.
# It creates a patch file for the wireless-regdb package to increase the TX power limit
# for Germany (DE) to 30 dBm for both 2.4 GHz and 5 GHz bands.

echo "Creating patch for wireless-regdb (DE -> 30dBm)..."

mkdir -p package/firmware/wireless-regdb/patches/

cat << 'EOF' > package/firmware/wireless-regdb/patches/999-custom-regdb-de.patch
--- a/db.txt
+++ b/db.txt
@@ -374,10 +374,10 @@
	(5490 - 5730 @ 160), (24), DFS

 country DE: DFS-ETSI
-	(2400 - 2483.5 @ 40), (20)
-	(5150 - 5250 @ 80), (23), NO-OUTDOOR, AUTO-BW
-	(5250 - 5350 @ 80), (20), NO-OUTDOOR, DFS, AUTO-BW
-	(5470 - 5725 @ 160), (27), DFS
-	(5725 - 5875 @ 20), (14)
+	(2400 - 2483.5 @ 40), (30)
+	(5150 - 5250 @ 80), (30), NO-OUTDOOR, AUTO-BW
+	(5250 - 5350 @ 80), (30), NO-OUTDOOR, DFS, AUTO-BW
+	(5470 - 5725 @ 160), (30), DFS
+	(5725 - 5875 @ 80), (30)
	# 60 GHz band channels 1-4,
	# ref: http://www.erodoc.org/docs/eco/pdf/ERC_REC_70-03_A.pdf
EOF

echo "Patch created at package/firmware/wireless-regdb/patches/999-custom-regdb-de.patch"
