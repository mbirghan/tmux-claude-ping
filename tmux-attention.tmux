#!/usr/bin/env bash
set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ATTN="$CURRENT_DIR/bin/tmux-attention"

tmux set-hook -g pane-focus-in "run-shell \"$ATTN clear-current\""
