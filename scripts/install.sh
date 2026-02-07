#!/bin/sh
set -e

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
INSTALL_PATH="${INSTALL_PATH:-$HOME/.local/bin}"

mkdir -p "$INSTALL_PATH"
cp "$ROOT_DIR/bin/tmux-attention" "$INSTALL_PATH/tmux-attention"
chmod +x "$INSTALL_PATH/tmux-attention"

printf '%s\n' "Installed tmux-attention to $INSTALL_PATH"
printf '%s\n' "Add $INSTALL_PATH to your PATH if needed."
