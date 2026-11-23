
#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

lb config --mode debian \
  --distribution bookworm \
  --architectures amd64 \
  --binary-images iso-hybrid \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer none \
  --iso-application "NovaOS Alpha 0.1" \
  --iso-volume "NOVAOS_ALPHA" \
  --apt-recommends false

lb build

mv live-image-amd64.hybrid.iso NovaOS-Alpha-0.1-amd64.iso
