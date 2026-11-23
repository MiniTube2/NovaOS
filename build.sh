#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
# Debian Bookworm is used for a predictable initial build on Ubuntu runners.
lb config --mode debian --distribution bookworm --architectures amd64 \
  --binary-images iso-hybrid --bootloaders syslinux,grub-efi \
  --archive-areas 'main contrib non-free non-free-firmware' \
  --debian-installer none --iso-application 'NovaOS Alpha 0.1' \
  --iso-volume 'NOVAOS_ALPHA' --apt-recommends false
lb build
mv live-image-amd64.hybrid.iso NovaOS-Alpha-0.1-amd64.iso
