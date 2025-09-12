#!/usr/bin/env bash
set -euo pipefail

# -------------------------------------------
# Build Flutter macOS release and zip it
# Output: ladder-macos-{version}.zip
# Requirements: flutter, Xcode CLT, ditto
# -------------------------------------------

# Run from the script's directory (project root)
cd "$(dirname "${BASH_SOURCE[0]}")"

PROJECT_ROOT="$PWD"
PUBSPEC="pubspec.yaml"
OUT_DIR="build/macos/Build/Products/Release"

# 1) Sanity checks
if [[ ! -f "$PUBSPEC" ]]; then
  echo "[ERROR] $PUBSPEC not found. Run this from your Flutter project root."
  exit 1
fi

command -v flutter >/dev/null 2>&1 || {
  echo "[ERROR] 'flutter' not found on PATH."
  exit 1
}

command -v ditto >/dev/null 2>&1 || {
  echo "[ERROR] 'ditto' not found (it should be on macOS by default)."
  exit 1
}

# 2) Extract version from pubspec.yaml
version_line="$(grep -E '^[[:space:]]*version[[:space:]]*:' "$PUBSPEC" | head -n 1 || true)"
if [[ -z "$version_line" ]]; then
  echo "[ERROR] Couldn't find a 'version:' line in $PUBSPEC"
  exit 1
fi

version="${version_line#*:}"            # take text after first colon
version="${version%%#*}"                # strip inline comments
version="${version//\"/}"               # remove double quotes
version="${version//\'/}"               # remove single quotes
version="$(printf "%s" "$version" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')"  # trim

if [[ -z "$version" ]]; then
  echo "[ERROR] Parsed version is empty."
  exit 1
fi

echo "[INFO] pubspec version: $version"

# Optional: strip build metadata (e.g. 1.2.3+4 -> 1.2.3)
# version="${version%%+*}"

# 3) Build macOS release
echo "[INFO] flutter build macos --release"
flutter build macos --release

# 4) Locate the .app bundle
if [[ ! -d "$OUT_DIR" ]]; then
  echo "[ERROR] Expected output folder not found: $OUT_DIR"
  exit 1
fi

app_path="$(ls -1 "$OUT_DIR"/*.app 2>/dev/null | head -n 1 || true)"
if [[ -z "$app_path" ]]; then
  echo "[ERROR] No .app found in $OUT_DIR"
  echo "        Contents:"
  ls -1 "$OUT_DIR" || true
  exit 1
fi

echo "[INFO] Found app: $(basename "$app_path")"

# 5) Create zip using ditto (preserves bundle structure & attributes)
zip_name="ladder-macos-${version}.zip"
[[ -f "$zip_name" ]] && rm -f "$zip_name"

echo "[INFO] Creating $zip_name"
# --keepParent keeps the .app directory itself in the archive
# --sequesterRsrc preserves extended attributes/resource forks correctly
ditto -c -k --sequesterRsrc --keepParent "$app_path" "$zip_name"

if [[ -f "$zip_name" ]]; then
  echo "[SUCCESS] Done: $zip_name"
  exit 0
else
  echo "[ERROR] Zip not created."
  exit 1
fi
