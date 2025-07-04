#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"

if [ -f "$CONFIG_DIR/ghostty/config" ]; then
    mkdir -p "$BACKUP_DIR/ghostty"
    cp "$CONFIG_DIR/ghostty/config" "$BACKUP_DIR/ghostty/config"
fi

if [ -f "$CONFIG_DIR/fastfetch/config.jsonc" ]; then
    mkdir -p "$BACKUP_DIR/fastfetch"
    cp "$CONFIG_DIR/fastfetch/config.jsonc" "$BACKUP_DIR/fastfetch/config.jsonc"
fi

if [ -f "$CONFIG_DIR/fastfetch/vagabond.txt" ]; then
    mkdir -p "$BACKUP_DIR/fastfetch"
    cp "$CONFIG_DIR/fastfetch/vagabond.txt" "$BACKUP_DIR/fastfetch/vagabond.txt"
fi

mkdir -p "$CONFIG_DIR/ghostty"
cp "$SCRIPT_DIR/ghostty/config" "$CONFIG_DIR/ghostty/config"

mkdir -p "$CONFIG_DIR/fastfetch"
cp "$SCRIPT_DIR/fastfetch/config.jsonc" "$CONFIG_DIR/fastfetch/config.jsonc"
cp "$SCRIPT_DIR/fastfetch/vagabond.txt" "$CONFIG_DIR/fastfetch/vagabond.txt"

echo "Deployed configs. Backups in: $BACKUP_DIR" 