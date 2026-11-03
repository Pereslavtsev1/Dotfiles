#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$CONFIG_DIR"
mkdir -p "$BACKUP_DIR"

echo "Backup directory: $BACKUP_DIR"

CONFIGS=(
    hypr
    matugen
    nvim
    starship
    fish
    kitty
)

for config in "${CONFIGS[@]}"; do
    SRC="$DOTFILES_DIR/$config"
    DEST="$CONFIG_DIR/$config"

    if [ ! -e "$SRC" ]; then
        echo "Skipping $config (not found in dotfiles)"
        continue
    fi

    if [ -e "$DEST" ] || [ -L "$DEST" ]; then
        echo "Backing up $DEST"
        mv "$DEST" "$BACKUP_DIR/"
    fi

    echo "Linking $SRC -> $DEST"
    ln -sfn "$SRC" "$DEST"
done

# Starship
if [ -f "$DOTFILES_DIR/starship.toml" ]; then
    if [ -e "$CONFIG_DIR/starship.toml" ] || [ -L "$CONFIG_DIR/starship.toml" ]; then
        echo "Backing up $CONFIG_DIR/starship.toml"
        mv "$CONFIG_DIR/starship.toml" "$BACKUP_DIR/"
    fi

    echo "Linking starship.toml"
    ln -sfn "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"
fi

# Matugen
MATUGEN_BASE_CONFIG="$HOME/.local/share/serpantinum/src/assets/matugen/config.toml"
MATUGEN_EXTRA_CONFIG="$HOME/.config/matugen/config.toml"
MATUGEN_OUTPUT_CONFIG="$HOME/.local/share/serpantinum/src/assets/matugen/config.toml"

if [[ ! -f "$MATUGEN_BASE_CONFIG" ]]; then
    echo "Matugen base config not found: $MATUGEN_BASE_CONFIG"
elif [[ ! -f "$MATUGEN_EXTRA_CONFIG" ]]; then
    echo "Matugen extra config not found: $MATUGEN_EXTRA_CONFIG"
else
    cp "$MATUGEN_OUTPUT_CONFIG" \
        "$BACKUP_DIR/matugen-config-$(date +%Y%m%d-%H%M%S).toml"

    TMP_CONFIG="$(mktemp)"
    cat "$MATUGEN_BASE_CONFIG" "$MATUGEN_EXTRA_CONFIG" >"$TMP_CONFIG"
    mv "$TMP_CONFIG" "$MATUGEN_OUTPUT_CONFIG"

    echo "Updated Matugen config: $MATUGEN_OUTPUT_CONFIG"
fi

echo
echo "Done."
echo "Backup saved to: $BACKUP_DIR"
